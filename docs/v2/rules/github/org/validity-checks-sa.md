# Rule: Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis

**ID**: `github-org-validity-checks-sa`
**Source**: [v2/rules/github/org/validity-checks-sa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks-sa.yaml)
**Uses**: `github/org/validity-checks-sa@v2/rules
**Rego Source**: [validity-checks-sa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks-sa.rego)

**Labels**: GitHub, Organization

**Short Description**: Verify `secret_scanning_validity_checks` is configured in the GitHub organization.

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
