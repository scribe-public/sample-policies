# Rule: Verify Secret_Scanning_Validity_Checks_Enabled Setting

**ID**: `github-org-validity-checks`  
**Source YAML**: `validity-checks.yaml`  
**Rego File Path**: `validity-checks.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify `secret_scanning_validity_checks` is configured in the GitHub repository.

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
