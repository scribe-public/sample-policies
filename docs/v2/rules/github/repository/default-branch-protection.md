# Rule: Verify Default Branch Protection

**ID**: `github-repo-default-branch-protection`
**Source**: [v2/rules/github/repository/default-branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/default-branch-protection.yaml)
**Uses**: `github/repository/default-branch-protection@v2/rules
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
