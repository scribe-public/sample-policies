# Rule: Restrict Commit Authors in GitLab Project

**ID**: `gitlab-project-allowed-commit-authors`  
**Source**: [v2/rules/gitlab/project/commit-author-email-check.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/commit-author-email-check.yaml)  
**Rego File Path**: `commit-author-email-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify only GitLab project users in the Allowed List have commit author permissions.

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
allowed_authors:
- mail@example.com
```
