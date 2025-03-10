# Rule: Allowed Users in GitLab Organization

**ID**: `gitlab-org-allowed-users`  
**Source**: [v2/rules/gitlab/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-users.yaml)  
**Rego File Path**: `allow-users.rego`  

**Labels**: Gitlab, Organization

**Short Description**: Verify only users in the Allowed List have access to the GitLab organization.

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
allowed_users: []
```
