# Rule: Reset Approvals on Push in GitLab Project

**ID**: `gitlab-project-reset-pprovals-on-push`  
**Source YAML**: `reset-pprovals-on-push.yaml`  
**Rego File Path**: `reset-pprovals-on-push.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify `reset_approvals_on_push` is set for the GitLab project.

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
reset_approvals_on_push: true
```
