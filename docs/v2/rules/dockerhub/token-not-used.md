# Rule: Verify no unused Dockerhub

**ID**: `dockerhub-token-not-used`  
**Source YAML**: `token-not-used.yaml`  
**Rego File Path**: `token-not-used.rego`  

**Labels**: Dockerhub

**Short Description**: Verify that there are no unused Dockerhub.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=project
```
