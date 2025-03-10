# Rule: Verify DockerHub Tokens are Active

**ID**: `dockerhub-token-expiration`  
**Source**: [v2/rules/dockerhub/token-expiration.yaml](scribe-public/sample-policies.git/v2/rules/dockerhub/token-expiration.yaml)  
**Rego File Path**: `token-expiration.rego`  

**Labels**: Dockerhub

**Short Description**: Verify that all discovered Dockerhub tokens are set to Active in Dockerhub.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=project
```
