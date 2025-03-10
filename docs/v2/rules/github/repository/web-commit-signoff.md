# Rule: Verify Repository Requires Commit Signoff

**ID**: `github-repo-web-commit-signoff`
**Source**: [v2/rules/github/repository/web-commit-signoff.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/web-commit-signoff.yaml)
**Uses**: `github/repository/web-commit-signoff@v2/rules
**Rego Source**: [web-commit-signoff.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/web-commit-signoff.rego)

**Labels**: GitHub, Repository

**Short Description**: Verify contributors sign off on commits to the GitHub repository through the GitHub web interface.

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
