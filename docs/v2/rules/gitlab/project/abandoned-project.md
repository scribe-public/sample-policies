# Rule: Verify Project Activity

**ID**: `gitlab-project-abandoned-project`  
**Source YAML**: `abandoned-project.yaml`  
**Rego File Path**: `abandoned-project.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the GitLab project is active for a specified duration.

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
inactive_for_days: 30
```
