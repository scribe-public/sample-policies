# Rule: Verify members_can_create_repositories setting

**ID**: `github-org-create-repos`  
**Source YAML**: `create-repos.yaml`  
**Rego File Path**: `create-repos.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify `members_can_create_repositories` is appropriately configured in the GitHub repository.

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
