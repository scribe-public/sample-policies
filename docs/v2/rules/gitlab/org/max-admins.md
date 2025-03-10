# Rule: Limit Admins in GitLab Organization

**ID**: `gitlab-org-max-admins`
**Source**: [v2/rules/gitlab/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/max-admins.yaml)
**Uses**: `gitlab/org/max-admins@v2/rules
**Rego Source**: [max-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/max-admins.rego)

**Labels**: Blueprint, GitLab, Organization

**Short Description**: Verify the maximum number of admins for the GitLab project is restricted.

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
max_admins: 0
```
