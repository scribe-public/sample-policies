# Rule: Block Users in GitLab Organization

**ID**: `gitlab-org-blocked-users`  
**Source YAML**: `blocked-users.yaml`  
**Rego File Path**: `blocked-users.rego`  

**Labels**: Gitlab, Organization

**Short Description**: Verify no users in the GitLab organization are on the block list.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=gitlab
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
blocked_users: []
```
