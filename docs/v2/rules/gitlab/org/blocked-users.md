# Rule: Block Users in GitLab Organization

**ID**: `gitlab-org-blocked-users`
**Source**: [v2/rules/gitlab/org/blocked-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/blocked-users.yaml)
**Uses**: `gitlab/org/blocked-users@v2/rules
**Rego Source**: [blocked-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/blocked-users.rego)

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
