# Rule: Verify Secret_Scanning_Push_Protection Setting

**ID**: `github-org-push-protection-sa`  
**Source YAML**: `push-protection-sa.yaml`  
**Rego File Path**: `push-protection-sa.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify `secret_scanning_push_protection` is configured in the GitHub repository.

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
