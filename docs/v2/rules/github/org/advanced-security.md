# Rule: Verify advanced_security_enabled_for_new_repositories setting

**ID**: `github-org-advanced-security`
**Source**: [v2/rules/github/org/advanced-security.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/advanced-security.yaml)
**Uses**: `github/org/advanced-security@v2/rules
**Rego Source**: [advanced-security.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/advanced-security.rego)

**Labels**: GitHub, Organization

**Short Description**: Verify `advanced_security` is enabled for new repositories in the GitHub organization.

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
