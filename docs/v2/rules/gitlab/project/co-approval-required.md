# Rule: Require Code Owner Approval in GitLab Project

**ID**: `gitlab-project-code-owner-approval`
**Source**: [v2/rules/gitlab/project/co-approval-required.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/co-approval-required.yaml)
**Uses**: `gitlab/project/co-approval-required@v2/rules
**Rego Source**: [co-approval-required.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/co-approval-required.rego)

**Labels**: Gitlab, Project

**Short Description**: Verify code owner approval is required for specific branches in the GitLab project.

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
branch: main
```
