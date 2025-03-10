# Rule: Require Password for Approvals in GitLab Project

**ID**: `gitlab-project-require-password-to-approve`
**Source**: [v2/rules/gitlab/project/require-password-to-approve.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/require-password-to-approve.yaml)
**Uses**: `gitlab/project/require-password-to-approve@v2/rules
**Rego Source**: [require-password-to-approve.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/require-password-to-approve.rego)

**Labels**: Gitlab, Project

**Short Description**: Verify the binary field `require_password_to_approve` is set for the GitLab project.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=gitlab
- asset_type=project
- '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index
  .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'
```
## Rule Parameters (`with`)

```yaml
require_password_to_approve: true
```
