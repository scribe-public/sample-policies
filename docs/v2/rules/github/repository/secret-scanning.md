# Rule: Verify secret_scanning setting

**ID**: `github-repo-secret-scanning`  
**Source**: [v2/rules/github/repository/secret-scanning.yaml](scribe-public/sample-policies.git/v2/rules/github/repository/secret-scanning.yaml)  
**Rego File Path**: `secret-scanning.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify `secret_scanning` is configured in the GitHub repository.

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
