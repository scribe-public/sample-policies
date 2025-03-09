# Rule: Allowed Committer Emails in GitLab Project

**ID**: `gitlab-project-allowed-committer-emails`  
**Source YAML**: `committer-email-check.yaml`  
**Rego File Path**: `committer-email-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify only users in the Allowed List use committer email addresses in the GitLab project.

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
allowed_committers:
- mail@example.com
```
