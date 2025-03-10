# Rule: Verify GitHub Organization Secrets Are Not Too Old

**ID**: `github-org-old-secrets`
**Source**: [v2/rules/github/org/old-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/old-secrets.yaml)
**Uses**: `github/org/old-secrets@v2/rules
**Rego File Path**: `old-secrets.rego`

**Labels**: GitHub, Organization

**Short Description**: Verify secrets in the GitHub organization are not older than the specified threshold.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
max_secret_age: 12
```
