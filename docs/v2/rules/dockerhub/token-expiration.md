# Verify DockerHub Tokens are Active  
**Type:** Rule  
**ID:** `dockerhub-token-expiration`  
**Uses:** `dockerhub/token-expiration@v2/rules`  
**Source:** [v2/rules/dockerhub/token-expiration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-expiration.yaml)  
**Rego Source:** [token-expiration.rego](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-expiration.rego)  
**Labels:** Dockerhub  

Verify that all discovered Dockerhub tokens are set to Active in Dockerhub.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project |

