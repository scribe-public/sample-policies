# Rule: Verify no unused Dockerhub

**ID**: `dockerhub-token-not-used`  
**Uses**: `dockerhub/token-not-used@v2/rules  
**Source**: [v2/rules/dockerhub/token-not-used.yaml](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-not-used.yaml)  
**Rego Source**: [token-not-used.rego](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-not-used.rego)  
**Short Description**: Verify that there are no unused Dockerhub.  
**Labels**: Dockerhub

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=project
```
