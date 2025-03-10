# Rule: Verify Commit Message Format

**ID**: `gitlab-project-verify-commit_message_check`  
**Source**: [v2/rules/gitlab/project/commit-message-check.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/commit-message-check.yaml)  
**Rego File Path**: `commit-message-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify that commit messages in the GitLab project adhere to the specified format template.

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
commit_message_regex: .*JIRA-\d+.*
```
