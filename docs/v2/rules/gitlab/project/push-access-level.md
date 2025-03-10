# Rule: Set Push Access Level in GitLab Project

**ID**: `gitlab-project-push-access-level`  
**Source**: [v2/rules/gitlab/project/push-access-level.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/push-access-level.yaml)  
**Rego File Path**: `push-access-level.rego`  

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
