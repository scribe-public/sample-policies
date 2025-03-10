# Rule: Verify DockerHub Tokens are Active  
**ID:** `dockerhub-token-expiration`  
**Uses:** `dockerhub/token-expiration@v2/rules`  
**Source:** [v2/rules/dockerhub/token-expiration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-expiration.yaml)  
**Rego Source:** [token-expiration.rego](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-expiration.rego)  
**Short Description:** Verify that all discovered Dockerhub tokens are set to Active in Dockerhub.  
**Labels:** Dockerhub  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=project'] |

