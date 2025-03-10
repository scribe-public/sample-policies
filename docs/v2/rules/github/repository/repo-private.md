# Rule: Verify Repository Is Private

**ID**: `github-repo-private`  
**Uses**: `github/repository/repo-private@v2/rules  
**Source**: [v2/rules/github/repository/repo-private.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/repo-private.yaml)  
**Rego Source**: [repo-private.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/repo-private.rego)  
**Short Description**: Verify the GitHub repository is private.  
**Labels**: GitHub, Repository

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
