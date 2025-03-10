# Rule: Check Message Substring

**ID**: `gitlab-project-message-substring-check`
**Source**: [v2/rules/gitlab/project/message-substring-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/message-substring-check.yaml)
**Uses**: `gitlab/project/message-substring-check@v2/rules
**Rego File Path**: `message-substring-check.rego`

**Labels**: Gitlab, Project

**Short Description**: Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project.

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
pattern: (?i)dghd
```
