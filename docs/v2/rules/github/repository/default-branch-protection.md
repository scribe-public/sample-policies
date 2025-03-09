# Rule: Verify Default Branch Protection

**ID**: `github-repo-default-branch-protection`  
**Source YAML**: `default-branch-protection.yaml`  
**Rego File Path**: `default-branch-protection.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify the default branch protection is configured in the GitHub repository.

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
