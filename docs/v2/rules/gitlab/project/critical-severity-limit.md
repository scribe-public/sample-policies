# Rule: Enforce Critical Severity Limit

**ID**: `gitlab-project-critical-severity-limit`  
**Source YAML**: `critical-severity-limit.yaml`  
**Rego File Path**: `critical-severity-limit.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the maximum allowed critical severity alerts for the GitLab project.

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
max_allowed_vulnerability_count: 0
```
