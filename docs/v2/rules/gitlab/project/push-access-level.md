# Rule: Set Push Access Level in GitLab Project

**ID**: `gitlab-project-push-access-level`
**Source**: [v2/rules/gitlab/project/push-access-level.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-access-level.yaml)
**Uses**: `gitlab/project/push-access-level@v2/rules
**Rego Source**: [push-access-level.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-access-level.rego)

**Labels**: Gitlab, Project

**Short Description**: Verify the GitLab project's push access level policy complies with requirements.

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
access_level_description: Maintainers
```
