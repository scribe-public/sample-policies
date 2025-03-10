# Rule: Verify Push Protection Setting

**ID**: `github-repo-push-protection`  
**Source**: [v2/rules/github/repository/push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/push-protection.yaml)  
**Rego File Path**: `push-protection.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify `secret_scanning_push_protection` is configured in the GitHub repository.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=repository
- '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index
  .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'
```
