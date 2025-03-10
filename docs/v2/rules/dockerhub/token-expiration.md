# Rule: Verify DockerHub Tokens are Active

**ID**: `dockerhub-token-expiration`
**Source**: [v2/rules/dockerhub/token-expiration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/dockerhub/token-expiration.yaml)
**Uses**: `dockerhub/token-expiration@v2/rules
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
