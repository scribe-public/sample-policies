---
sidebar_label: Verify no unused Dockerhub
title: Verify no unused Dockerhub
---  
# Verify no unused Dockerhub  
**Type:** Rule  
**ID:** `dockerhub-token-not-used`  
**Uses:** `dockerhub/token-not-used@v2/rules`  
**Source:** [v2/rules/dockerhub/token-not-used.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-not-used.yaml)  
**Rego Source:** [token-not-used.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-not-used.rego)  
**Labels:** Dockerhub  

Verify that there are no unused Dockerhub.

:::note 
This rule requires Dockerhub Project Discovery Evidence.  
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
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project<br/>- platform=dockerhub |

