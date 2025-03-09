# Rule: Set Author Email Regex in GitLab Project

**ID**: `gitlab-project-author-email-regex`  
**Source YAML**: `author-email-regex.yaml`  
**Rego File Path**: `author-email-regex.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the `author_email_regex` for the GitLab project is set to the specified value.

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
author_email_regex: ''
```
