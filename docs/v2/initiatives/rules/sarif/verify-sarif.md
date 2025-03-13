---
sidebar_label: Verify Rule Compliance in SARIF
title: Verify Rule Compliance in SARIF
---  
# Verify Rule Compliance in SARIF  
**Type:** Rule  
**ID:** `sarif-policy`  
**Uses:** `sarif/verify-sarif@v2/rules`  
**Source:** [v2/rules/sarif/verify-sarif.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/verify-sarif.yaml)  
**Rego Source:** [verify-sarif.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/verify-sarif.rego)  
**Labels:** SARIF  

Verify the SARIF report complies with defined generic rules for compliance and security.

:::note 
This rule requires SARIF Evidence. See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures that the SARIF report adheres to the predefined generic compliance rules by validating  the vulnerability types, severity levels, and total number of findings. This verification helps maintain  a consistent security posture and prevents the use of images with unacceptable vulnerability profiles.



## Description  
This rule evaluates the SARIF report provided as evidence to verify that it meets a set of predefined generic rules.
It does so by using helper functions from the `data.sarif` module to:

1. Check that the vulnerability results in the report (found under `input.evidence.predicate.content.runs[0].results`)
   conform to the expected type and severity level as defined by configuration parameters (such as `rule_level`, `precision`, 
   `rule_ids`, and `ignore`).
2. Ensure that the total number of reported violations does not exceed the maximum allowed (`with.max_allowed`).

If the number of violations exceeds the threshold, a violation is recorded with details including the rule identifier, 
severity, and the corresponding location in the artifact.

### **Evidence Requirements**

- Evidence must be provided in a generic format that adheres to the SARIF 2.1.0 schema.
- The SARIF report should include a structured list of vulnerability results, along with rule definitions and descriptions.
- The evaluation uses the configuration parameters provided in the `with` section to guide the verification process.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| rule_level | array | False | List of rule levels to check for in the SARIF report. |
| precision | array | False | List of precision levels to check for in the SARIF report. |
| rule_ids | array | False | List of rule IDs to check for in the SARIF report. |
| ignore | array | False | List of rule IDs to ignore in the SARIF report. |
| max_allowed | integer | False | The maximum number of allowed violations. |

