---
sidebar_label: Required Generic Evidence Exists
title: Required Generic Evidence Exists
---  
# Required Generic Evidence Exists  
**Type:** Rule  
**ID:** `generic-required-evidence`  
**Uses:** `generic/evidence-exists@v2/rules`  
**Source:** [v2/rules/generic/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/generic/evidence-exists.rego)  
**Labels:** 3rd-party  

Verify required evidence exists.

:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/generic/v0.1 |

