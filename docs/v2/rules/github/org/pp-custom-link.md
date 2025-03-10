# Rule: Verify Secret_Scanning_Push_Protection_Custom_Link_Enabled Setting

**ID**: `github-org-pp-custom-link`
**Source**: [v2/rules/github/org/pp-custom-link.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/pp-custom-link.yaml)
**Uses**: `github/org/pp-custom-link@v2/rules
**Rego Source**: [pp-custom-link.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/pp-custom-link.rego)

**Labels**: GitHub, Organization

**Short Description**: Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization.

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
desired_value: false
```
