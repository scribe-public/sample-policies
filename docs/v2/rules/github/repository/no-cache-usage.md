# Rule: Verify No Cache Usage Exists in Repository

**ID**: `github-repo-no-cache-usage`
**Source**: [v2/rules/github/repository/no-cache-usage.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-cache-usage.yaml)
**Uses**: `github/repository/no-cache-usage@v2/rules
**Rego File Path**: `no-cache-usage.rego`

**Labels**: GitHub, Repository

**Short Description**: Verify the GitHub repository has no cache usage.

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
