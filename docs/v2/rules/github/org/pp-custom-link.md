# Rule: Verify Secret_Scanning_Push_Protection_Custom_Link_Enabled Setting

**ID**: `github-org-pp-custom-link`  
**Source YAML**: `pp-custom-link.yaml`  
**Rego File Path**: `pp-custom-link.rego`  

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
