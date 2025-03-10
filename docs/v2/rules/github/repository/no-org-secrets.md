# Rule: Verify No Organization Secrets Exist in Repository

**ID**: `github-repo-no-org-secrets`
**Source**: [v2/rules/github/repository/no-org-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-org-secrets.yaml)
**Uses**: `github/repository/no-org-secrets@v2/rules
**Rego File Path**: `no-org-secrets.rego`

**Labels**: GitHub, Repository

**Short Description**: Verify no organization secrets exist in the GitHub repository.

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
