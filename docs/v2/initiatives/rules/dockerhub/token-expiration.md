---
sidebar_label: Verify DockerHub Tokens are Active
title: Verify DockerHub Tokens are Active
---  
# Verify DockerHub Tokens are Active  
**Type:** Rule  
**ID:** `dockerhub-token-expiration`  
**Source:** [v2/rules/dockerhub/token-expiration.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-expiration.yaml)  
**Rego Source:** [token-expiration.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/dockerhub/token-expiration.rego)  
**Labels:** Dockerhub  

Verify that all discovered Dockerhub tokens are set to Active in Dockerhub.

:::note 
This rule requires Dockerhub Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensure that all Dockerhub tokens are set to Active status in Dockerhub preventing unauthorized access to Dockerhub resources.


## Description  
This rule verifies that all discovered Dockerhub tokens are set to Active in Dockerhub.
It performs the following steps:

1. Iterates over the Dockerhub tokens in the project.
2. Checks each token's status against the Active status.
   - If a token's status is not Active, the rule flags it as a violation.

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

