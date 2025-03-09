# Rule: Limit Admin Number in GitHub Organization

**ID**: `github-org-max-admins`  
**Source YAML**: `max-admins.yaml`  
**Rego File Path**: `max-admins.rego`  

**Labels**: Blueprint, GitHub, Organization

**Short Description**: Verify the maximum number of GitHub organization admins is restricted.

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
max_admins: 0
```
