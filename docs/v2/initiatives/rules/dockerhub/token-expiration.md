---
sidebar_label: Verify DockerHub Tokens are Active
title: Verify DockerHub Tokens are Active
---  
# Verify DockerHub Tokens are Active  
**Type:** Rule  
**ID:** `dockerhub-token-expiration`  
**Uses:** `dockerhub/token-expiration@v2/rules`  
**Source:** [v2/rules/dockerhub/token-expiration.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-expiration.yaml)  
**Rego Source:** [token-expiration.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-expiration.rego)  
**Labels:** Dockerhub  

Verify that all discovered Dockerhub tokens are set to Active in Dockerhub.

:::note 
This rule requires Discovery Evidence.  
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
| labels | - asset_type=project |

