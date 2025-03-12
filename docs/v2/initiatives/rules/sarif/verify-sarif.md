---
sidebar_label: Verify Rule Compliance in SARIF
title: Verify Rule Compliance in SARIF
---  
# Verify Rule Compliance in SARIF  
**Type:** Rule  
**ID:** `sarif-policy`  
**Uses:** `sarif/verify-sarif@v2/rules`  
**Source:** [v2/rules/sarif/verify-sarif.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-sarif.yaml)  
**Rego Source:** [verify-sarif.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-sarif.rego)  
**Labels:** SARIF  

Verify the SARIF report complies with defined generic rules for compliance and security.


## Mitigation  
Ensures that the SARIF report adheres to the predefined generic compliance rules by validating  the vulnerability types, severity levels, and total number of findings. This verification helps maintain  a consistent security posture and prevents the use of images with unacceptable vulnerability profiles.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| rule_level | [] |
| precision | [] |
| rule_ids | [] |
| ignore | [] |
| max_allowed | 0 |
