# Rule: Verify All Commits Are Signed in Repository

**ID**: `github-repo-signed-commits`
**Source**: [v2/rules/github/repository/check-signed-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/check-signed-commits.yaml)
**Uses**: `github/repository/check-signed-commits@v2/rules
**Rego Source**: [check-signed-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/check-signed-commits.rego)

**Labels**: GitHub, Repository

**Short Description**: Verify all commits in the GitHub repository are signed.

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
