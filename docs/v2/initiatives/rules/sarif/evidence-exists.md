---
sidebar_label: Verify Required Evidence in SARIF
title: Verify Required Evidence in SARIF
---  
# Verify Required Evidence in SARIF  
**Type:** Rule  
**ID:** `required-sarif-evidence`  
**Uses:** `sarif/evidence-exists@v2/rules`  
**Source:** [v2/rules/sarif/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/evidence-exists.rego)  
**Labels:** SARIF  

Verify all required evidence exists as defined by the SARIF policy.

:::note 
This rule requires SARIF Evidence. See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
By confirming that all required evidence exists, this rule guarantees that the outputs from various security scans  (such as vulnerability assessments, configuration checks, and static analysis) are fully represented as evidence.



## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

