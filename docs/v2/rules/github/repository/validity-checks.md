# Rule: Verify secret scanning.

**ID**: `github-repo-validity-checks`
**Source**: [v2/rules/github/repository/validity-checks.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/validity-checks.yaml)
**Uses**: `github/repository/validity-checks@v2/rules
**Rego File Path**: `validity-checks.rego`

**Labels**: GitHub, Repository

**Short Description**: Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories.

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
