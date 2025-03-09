# Rule: Enable Commit Committer Check in GitLab Project

**ID**: `gitlab-project-verify-commit_committer_check`  
**Source YAML**: `commit-committer-check.yaml`  
**Rego File Path**: `commit-committer-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify `commit_committer_check` is enabled for the GitLab project.

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
