# Rule: Verify two_factor_requirement_enabled setting

**ID**: `github-org-2fa`  
**Source**: [v2/rules/github/org/2fa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/2fa.yaml)  
**Rego File Path**: `2fa.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify `two_factor_requirement` is enabled in the GitHub organization.

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
