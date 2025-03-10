# Rule: Verify Commit Message Format

**ID**: `gitlab-project-verify-commit_message_check`  
**Uses**: `gitlab/project/commit-message-check@v2/rules  
**Source**: [v2/rules/gitlab/project/commit-message-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-message-check.yaml)  
**Rego Source**: [commit-message-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-message-check.rego)  
**Short Description**: Verify that commit messages in the GitLab project adhere to the specified format template.  
**Labels**: Gitlab, Project

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
