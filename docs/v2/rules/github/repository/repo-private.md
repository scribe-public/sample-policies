# Rule: Verify Repository Is Private

**ID**: `github-repo-private`  
**Source**: [v2/rules/github/repository/repo-private.yaml](scribe-public/sample-policies.git/v2/rules/github/repository/repo-private.yaml)  
**Rego File Path**: `repo-private.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify the GitHub repository is private.

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
