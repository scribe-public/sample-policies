# Verify no unused Dockerhub  
**Type:** Rule  
**ID:** `dockerhub-token-not-used`  
**Uses:** `dockerhub/token-not-used@v2/rules`  
**Source:** [v2/rules/dockerhub/token-not-used.yaml](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-not-used.yaml)  
**Rego Source:** [token-not-used.rego](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-not-used.rego)  
**Labels:** Dockerhub  

Verify that there are no unused Dockerhub.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project |

