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
This rule requires Dockerhub Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/platforms/discover#dockerhub-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Description  
This rule verifies that there are no unused Dockerhub.
It performs the following steps:

1. Iterates over the Dockerhub tokens in the project.
2. Checks each token's last_used is null , the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Dockerhub resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project<br/>- platform=dockerhub |

