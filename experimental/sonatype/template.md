# Creating a Custom Policy for Sonatype Nexus IQ Reports

## Exploring the Nexus IQ report

In order to get to understand how this report is structured, we first explore it in a few ways.

First, let's have a look at the JSON structure of the report:
<!--
{
    "command": "cat report.json",
    "output-format": "json",
    "print_command": true,
    "limit": 50
}
-->

It is easy to see that the report has a metadata header, and then a list of findings.

To better understand the finings fields, let's get some of the fields values:

Exploring the policyName field reviels that there are multiple policies that are being checked in the report:

<!--
{
    "command": "cat report.json | grep policyName| sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->

Exploring the threatLevel reviels the following threat levels:

<!--
{
    "command": "cat report.json | grep threatLevel| sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->

To understand the connection between the policyName and the threatLevel, we can run the following command:

```bash
jq -r '.policyEvaluationResult.alerts[] | "\(.trigger.policyName) \(.trigger.threatLevel)"' report.json | sort | uniq
```

```json
Architecture-Cleanup 1
Component-Similar 7
Component-Unknown 2
License Weak Copy Left 5
License-Banned 10
License-Threat Not Assigned 7
Not Approve License 7
OldPackage 7
Security-Critical 10
Security-High 9
Security-Low 3
Security-Medium 7
```

We can see that policies are mapped to threat levels.

We notice that there are some string fields, let's see what we kind of data they include:
Contstraints fields:

<!--
{
    "command": "cat report.json | grep constraintName | sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->

We can see that in the sample we have, the constraint name is highly correlated with the policy name.

<!--
{
    "command": "cat report.json | grep conditionTypeId | sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->

<!--
{
    "command": "cat report.json | grep summary | sort | uniq",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->


<!--
{
    "command": "cat report.json | grep reason | sort | uniq",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->

Lets see where we can find CVE information:
<!--
{
    "command": "cat report.json | grep 'CVE'",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->

So we can see that the CVE information is in the reference and in the reason fields.

Summing up, it seams that the `reason` field is the most interesting field to search for in the report.

## Designing a policy

In order to allow our customers to run policies on the Nexus IQ reports, we need to design a policy-rule that will allow them to check for specific conditions in the report:

* Specify the policies name to enforce
* Specify a threat level to enforce
* Sepcify a substring in the reason field

A more detailed specification:

1. Allow the user to specify a list of policies; if the report contains any of these policies in the 'alerts' section, the policy-rule will fail.
2. Allow the usser to specify a minimum threat level; if the report contains any of these policies in the 'alerts' section with a threat level higher than the specified level, the policy-rule will fail.
3. Allow the user to specify a list of substrings to search for in the 'reason' field; if the report contains any of these substrings in the 'alerts' section, the policy-rule will fail.
4. If the user does not specify a configuration for any of the above rules, the rule is not evaluated and the policy-rule success will detemine on the other conditions.

Such a policy-rule will enable the user to define a custom policy. A sample policy could include the following rule:

1. Don't allow threat levels higher than 8
2. Don't allow a specific policy such as 'License-Banned'
3. Warn if there is any CVE with a CVSS score higher than 6.7

## Implementing the policy

Implementing a policy in valint involves createing a new policy-rule, and this requires creating two files:

1. `sonatypte.yml` - the policy configuration file. This is the file that the user will use to configure the policy.
2. `sonatype.rego` - the policy rule implementation. In most cases, the user does not need to modify this file, but he still has the capability to do so.

### The policy configuration file

The policy configuration file is a YAML file that contains metadata and configurtion of the policy:
<!--
{
    "command": "cat nexus-threat-level.yaml",
    "output-format": "yaml"
}
-->
<!--
{
    "command": "cat nexus-disallowed-policies.yaml",
    "output-format": "yaml"
}
-->
<!--
{
    "command": "cat nexus-disallowed-reasons.yaml",
    "output-format": "yaml"
}
-->

Explanation:

* The top section is the metadata of the policy. It contains the name, description, the implementation file name. Additional metadata fields are explained in `valint` documentation.
* The middle section defines the criteria to get the evidence that will be used for the policy evaluation. In this case

```json
"B I G   T B D"
```

* The bottom section defines the configuration of the policy. In this case we support 3 parameters:
  * `policies` - a list of policies to check for
  * `min_threat_level` - the minimum threat level to allow
  * `reason_substrings` - a list of substrings to search for in the reason field

### The policy rule implementation

The policy rule implementation is a rego file that contains the policy rule. It is required to use specific interfaces:

* The configuration is passed to the rule as part of the `input` object, in `input.config.args`
* The input evidence is passed to the rule as part of the `input` object, in `input.evidence`. The structure of the evidence the original structure of the report, wrapped in an `in-toto attestation` object. Thus when implementing we can directly access the fields of the report.
* The output of the rule is a `verify` object, that containse the final results, as well as details about the rule evaluation.

## Running the policy

### Create an attestation

The attestation is the evidence that the policy is evaluated on. It is created by running the following command:

<!--
{
    "command": "valint evidence report.json --tool sonatype",
    "print_command": true,
    "output-format": "bash",
    "limit": 30
}
-->

Where `report.json` is the Nexus IQ report, and the `--tool sonatype` flag is the tool label of the evidence.

### Evaluate the policy
<!--
{
    "command": "valint verify -D error --rule nexus-threat-level.yaml --rule nexus-disallowed-policies.yaml --rule nexus-disallowed-reasons.yaml --output-file sonatype-sarif.json",
    "print_command": true,
    "output-format": "bash",
    "limit": 30
}
-->

`valint` will fail if the policy evaluation fails. This is usefull to gate a pipeline with a policy.

In addition, the result of the evaluation is a new attestation, or can be output form `valint`. In this case we saved the output as the `sonatype-sarif.json` file. Now we can use any SARIF viewer to view the results.

Here are a few snippets from the results:
<!--
{
    "command": "jq '.predicate.content.runs[].tool.driver.rules[].name' sonatype-sarif.json",
    "print_command": true
}
-->

<!--
{
    "command": " jq '.predicate.content.runs[].results[].message' sonatype-sarif.json",
    "print_command": true,
    "limit": 30
}
-->

## Summary

In this tutorial we have explored the Nexus IQ report, designed a policy, implemented it, and evaluated it. This is a simple example of how to create a custom `valint` policy for a specific report. The same process can be used to create policies for any other report.
