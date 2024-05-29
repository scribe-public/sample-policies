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
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json
```
```json
{
  "applicationId" : "example-app",
  "scanId" : "c57558b5050944aaa9e22a7f5c7b677e",
  "reportHtmlUrl" : "https://slpnexus-proxy.fibi.corp/ui/links/application/example-app/report/c57558b5050944aaa9e22a7f5c7b677e",
  "reportPdfUrl" : "https://slpnexus-proxy.fibi.corp/ui/links/application/example-app/report/c57558b5050944aaa9e22a7f5c7b677e/pdf",
  "reportDataUrl" : "https://slpnexus-proxy.fibi.corp/api/v2/applications/example-app/reports/c57558b5050944aaa9e22a7f5c7b677e/raw",
  "policyAction" : "None",
  "policyEvaluationResult" : {
    "alerts" : [ {
      "trigger" : {
        "policyId" : "032555a20f0d4c8b8f8ce0b6ca7e05ac",
        "policyName" : "Component-Unknown",
        "threatLevel" : 2,
        "policyViolationId" : "378439df98c94e739787f3f2b4342cde",
        "componentFacts" : [ {
          "componentIdentifier" : null,
          "hash" : "000b15b1e83f10956b76",
          "constraintFacts" : [ {
            "constraintId" : "c52b6d17dd2243fcaae20d4ded8b7bca",
            "constraintName" : "Unknown 3rd party component",
            "operatorName" : "AND",
            "conditionFacts" : [ {
              "conditionTypeId" : "MatchState",
              "conditionIndex" : 0,
              "summary" : "Match State is unknown",
              "reason" : "Match state was 'Unknown'",
              "reference" : null,
              "triggerJson" : null
            }, {
              "conditionTypeId" : "Proprietary",
              "conditionIndex" : 0,
              "summary" : "Proprietary is false",
              "reason" : "Component does not contain proprietary packages",
              "reference" : null,
              "triggerJson" : null
            }, {
              "conditionTypeId" : "DataSource",
              "conditionIndex" : 0,
              "summary" : "Data Source has support for identity",
              "reason" : "Data Source has support for Identity",
              "reference" : null,
              "triggerJson" : null
            } ]
          } ],
          "pathnames" : [ ],
          "displayName" : null
        } ]
      },
      "actions" : [ ]
    }, {
```
<!-- { "object-type": "command-output-end" } -->


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
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep policyName| sort | uniq
```
```json
        "policyName" : "Architecture-Cleanup",
        "policyName" : "Component-Similar",
        "policyName" : "Component-Unknown",
        "policyName" : "License-Banned",
        "policyName" : "License-Threat Not Assigned",
        "policyName" : "License Weak Copy Left",
        "policyName" : "Not Approve License",
        "policyName" : "OldPackage",
        "policyName" : "Security-Critical",
        "policyName" : "Security-High",
        "policyName" : "Security-Low",
        "policyName" : "Security-Medium",
```
<!-- { "object-type": "command-output-end" } -->


Exploring the threatLevel reviels the following threat levels:

<!--
{
    "command": "cat report.json | grep threatLevel| sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep threatLevel| sort | uniq
```
```json
        "threatLevel" : 1,
        "threatLevel" : 10,
        "threatLevel" : 2,
        "threatLevel" : 3,
        "threatLevel" : 5,
        "threatLevel" : 7,
        "threatLevel" : 9,
```
<!-- { "object-type": "command-output-end" } -->


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
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep constraintName | sort | uniq
```
```json
            "constraintName" : "Critical risk CVSS score",
            "constraintName" : "High risk CVSS score",
            "constraintName" : "License not approved in any situation",
            "constraintName" : "License threat group has not been assigned",
            "constraintName" : "License Weak Copy Left",
            "constraintName" : "Low risk CVSS score",
            "constraintName" : "Medium risk CVSS score",
            "constraintName" : "Not Approve License",
            "constraintName" : "oldpackage",
            "constraintName" : "Test components",
            "constraintName" : "Unknown 3rd party component",
            "constraintName" : "Unknown modification to component",
```
<!-- { "object-type": "command-output-end" } -->


We can see that in the sample we have, the constraint name is highly correlated with the policy name.

<!--
{
    "command": "cat report.json | grep conditionTypeId | sort | uniq",
    "output-format": "json",
    "print_command": true
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep conditionTypeId | sort | uniq
```
```json
              "conditionTypeId" : "AgeInDays",
              "conditionTypeId" : "Coordinates",
              "conditionTypeId" : "DataSource",
              "conditionTypeId" : "License",
              "conditionTypeId" : "License Threat Group",
              "conditionTypeId" : "MatchState",
              "conditionTypeId" : "Proprietary",
              "conditionTypeId" : "SecurityVulnerabilitySeverity",
```
<!-- { "object-type": "command-output-end" } -->


<!--
{
    "command": "cat report.json | grep summary | sort | uniq",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep summary | sort | uniq
```
```json
              "summary" : "Age older than 5475 days",
              "summary" : "Coordinates do not match maven:org.eclipse.*:*:*:*:*",
              "summary" : "Coordinates match maven:junit:junit:*:*:*",
              "summary" : "Data Source has support for identity",
              "summary" : "License is not '0BSD'",
              "summary" : "License is not 'Apache'",
              "summary" : "License is not 'Apache-2.0'",
              "summary" : "License is not 'Artistic-2.0'",
              "summary" : "License is not 'BlueOak-1.0.0'",
              "summary" : "License is not 'BSD'",
              "summary" : "License is not 'BSD-2-Clause'",
              "summary" : "License is not 'BSD-2-Clause-NetBSD'",
              "summary" : "License is not 'BSD-2-Clause-Patent'",
              "summary" : "License is not 'BSD-3-Clause'",
              "summary" : "License is not 'BSD-3-Clause-Clear'",
              "summary" : "License is not 'CC0-1.0'",
              "summary" : "License is not 'CC-BY'",
              "summary" : "License is not 'CC-BY-3.0'",
              "summary" : "License is not 'CC-BY-4.0'",
              "summary" : "License is not 'EDL-1.0'",
```
<!-- { "object-type": "command-output-end" } -->



<!--
{
    "command": "cat report.json | grep reason | sort | uniq",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep reason | sort | uniq
```
```json
              "reason" : "Component does not contain proprietary packages",
              "reason" : "Coordinates were com.microsoft.alm : auth-common : 0.6.0 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Coordinates were com.microsoft.alm : auth-core : 0.6.0 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Coordinates were com.microsoft.alm : auth-secure-storage : 0.6.0 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Coordinates were com.sonatype.clm : clm-maven-plugin : 2.23.0-01 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Coordinates were hsqldb : hsqldb : 1.8.0.10 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Coordinates were junit : junit : 4.12 (match junit : junit : * : * : *)",
              "reason" : "Coordinates were org.slf4j : slf4j-log4j12 : 1.7.19 (do not match org.eclipse.* : * : * : * : *)",
              "reason" : "Data Source has support for Identity",
              "reason" : "Did not find '0BSD' license",
              "reason" : "Did not find a license in the 'Microsoft' license threat group",
              "reason" : "Did not find a license in the 'Oracle' license threat group",
              "reason" : "Did not find 'Apache-2.0' license",
              "reason" : "Did not find 'Apache' license",
              "reason" : "Did not find 'Artistic-2.0' license",
              "reason" : "Did not find 'BlueOak-1.0.0' license",
              "reason" : "Did not find 'BSD-2-Clause' license",
              "reason" : "Did not find 'BSD-2-Clause-NetBSD' license",
              "reason" : "Did not find 'BSD-2-Clause-Patent' license",
              "reason" : "Did not find 'BSD-3-Clause-Clear' license",
```
<!-- { "object-type": "command-output-end" } -->


Lets see where we can find CVE information:
<!--
{
    "command": "cat report.json | grep 'CVE'",
    "output-format": "json",
    "print_command": true,
    "limit": 20
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
cat report.json | grep 'CVE'
```
```json
              "reason" : "Found security vulnerability CVE-2022-22950 with severity >= 6 (severity = 6.5)",
                "value" : "CVE-2022-22950",
              "reason" : "Found security vulnerability CVE-2022-22950 with severity < 9 (severity = 6.5)",
                "value" : "CVE-2022-22950",
              "reason" : "Found security vulnerability CVE-2023-20861 with severity >= 6 (severity = 6.5)",
                "value" : "CVE-2023-20861",
              "reason" : "Found security vulnerability CVE-2023-20861 with severity < 9 (severity = 6.5)",
                "value" : "CVE-2023-20861",
              "reason" : "Found security vulnerability CVE-2023-20863 with severity >= 6 (severity = 6.5)",
                "value" : "CVE-2023-20863",
              "reason" : "Found security vulnerability CVE-2023-20863 with severity < 9 (severity = 6.5)",
                "value" : "CVE-2023-20863",
              "reason" : "Found security vulnerability CVE-2021-4104 with severity >= 6 (severity = 7.5)",
                "value" : "CVE-2021-4104",
              "reason" : "Found security vulnerability CVE-2021-4104 with severity < 9 (severity = 7.5)",
                "value" : "CVE-2021-4104",
              "reason" : "Found security vulnerability CVE-2022-23302 with severity >= 6 (severity = 8.8)",
                "value" : "CVE-2022-23302",
              "reason" : "Found security vulnerability CVE-2022-23302 with severity < 9 (severity = 8.8)",
                "value" : "CVE-2022-23302",
```
<!-- { "object-type": "command-output-end" } -->


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
<!-- { "object-type": "command-output-start" } -->
```yaml
name: sonatype-nexus-threat-level
path: nexus-threat-level.rego
description: "Verify that there's no alerts with threat level above specified threshold in the Sonatype Nexus report"

evidence:
  signed: false
  content_body_type: generic
  target_type: data
  tool: sonatype


with:
  min_threat_level: 9
```
<!-- { "object-type": "command-output-end" } -->

<!--
{
    "command": "cat nexus-disallowed-policies.yaml",
    "output-format": "yaml"
}
-->
<!-- { "object-type": "command-output-start" } -->
```yaml
name: sonatype-nexus-disallowed-policies
path: nexus-disallowed-policies.rego
description: "Verify that there's no disallowed policies in the Sonatype Nexus report"

evidence:
  signed: false
  content_body_type: generic
  target_type: data
  tool: sonatype


with:
  denied_policies:
    - "License-Banned"
```
<!-- { "object-type": "command-output-end" } -->

<!--
{
    "command": "cat nexus-disallowed-reasons.yaml",
    "output-format": "yaml"
}
-->
<!-- { "object-type": "command-output-start" } -->
```yaml
name: sonatype-nexus-disallowed-reasons
path: nexus-disallowed-reasons.rego
description: "Verify that there's no disallowed reasons in the Sonatype Nexus report"

evidence:
  signed: false
  content_body_type: generic
  target_type: data
  tool: sonatype


with:
  reason_substrings:
    - "(severity = 7.5)"
```
<!-- { "object-type": "command-output-end" } -->


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
<!-- { "object-type": "command-output-start" } -->
```bash
valint evidence report.json --tool sonatype
```
<!-- { "object-type": "command-output-end" } -->


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
<!-- { "object-type": "command-output-start" } -->
```bash
valint verify -D error --rule nexus-threat-level.yaml --rule nexus-disallowed-policies.yaml --rule nexus-disallowed-reasons.yaml --output-file sonatype-sarif.json
```
```bash
Error: policy check failed, Policies [default] failed with the following errors.
* rule [sonatype-nexus-threat-level] failed
* rule [sonatype-nexus-disallowed-policies] failed
* rule [sonatype-nexus-disallowed-reasons] failed

[0;90m[2024-05-27 13:48:51][0m [0;31mERROR[0m policy check failed, Policies [default] failed with the following errors.
* rule [sonatype-nexus-threat-level] failed
* rule [sonatype-nexus-disallowed-policies] failed
* rule [sonatype-nexus-disallowed-reasons] failed


```
<!-- { "object-type": "command-output-end" } -->


`valint` will fail if the policy evaluation fails. This is usefull to gate a pipeline with a policy.

In addition, the result of the evaluation is a new attestation, or can be output form `valint`. In this case we saved the output as the `sonatype-sarif.json` file. Now we can use any SARIF viewer to view the results.

Here are a few snippets from the results:
<!--
{
    "command": "jq '.predicate.content.runs[].tool.driver.rules[].name' sonatype-sarif.json",
    "print_command": true
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
jq '.predicate.content.runs[].tool.driver.rules[].name' sonatype-sarif.json
```
```bash
"Sonatype Nexus Threat Level"
"Sonatype Nexus Disallowed Policies"
"Sonatype Nexus Disallowed Reasons"
```
<!-- { "object-type": "command-output-end" } -->


<!--
{
    "command": " jq '.predicate.content.runs[].results[].message' sonatype-sarif.json",
    "print_command": true,
    "limit": 30
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
 jq '.predicate.content.runs[].results[].message' sonatype-sarif.json
```
```bash
{
  "text": "1/1 evidence origin and signature verified",
  "markdown": "1/1 evidence origin and signature verified"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"License-Banned\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"cdedcd78dbca4255b7aba9657c237d3d\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"License-Banned\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"cdedcd78dbca4255b7aba9657c237d3d\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"2cbc93ad722f4a7aacd625272fa1485f\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"2cbc93ad722f4a7aacd625272fa1485f\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"2fb2ae2a352c4e4e9be314d503ecf9b2\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"2fb2ae2a352c4e4e9be314d503ecf9b2\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"3420041b7be64cadaeb84518e40a2c93\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"3420041b7be64cadaeb84518e40a2c93\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"360c95b1793b4e45b68d719b093210fa\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"360c95b1793b4e45b68d719b093210fa\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"3fd6c2d2e1c7496fa853a747bfaba4d4\"\n}",
  "markdown": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"3fd6c2d2e1c7496fa853a747bfaba4d4\"\n}"
}
{
  "text": "37 violations | 0 max allowed.\n{\n  \"policy_name\": \"Security-Critical\",\n  \"reason\": \"Threat level violation 10\",\n  \"violation_id\": \"4bc90dba834a4ff6984a84d4fe3eec80\"\n}",
```
<!-- { "object-type": "command-output-end" } -->


## Summary

In this tutorial we have explored the Nexus IQ report, designed a policy, implemented it, and evaluated it. This is a simple example of how to create a custom `valint` policy for a specific report. The same process can be used to create policies for any other report.
