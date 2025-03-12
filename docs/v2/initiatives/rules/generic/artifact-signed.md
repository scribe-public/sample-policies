---
sidebar_label: Generic Artifact Signed
title: Generic Artifact Signed
---  
# Generic Artifact Signed  
**Type:** Rule  
**ID:** `generic-artifact-signed`  
**Uses:** `generic/artifact-signed@v2/rules`  
**Source:** [v2/rules/generic/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/generic/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/generic/artifact-signed.rego)  
**Labels:** 3rd-party  

Verify required evidence is signed.

:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::note 
This rule requires Signed Generic Statement.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS** required by default.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | True |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/generic/v0.1 |

