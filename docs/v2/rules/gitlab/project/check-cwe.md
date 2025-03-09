# Rule: Check CWE Compliance

**ID**: `gitlab-project-check-cwe`  
**Source YAML**: `check-cwe.yaml`  
**Rego File Path**: `check-cwe.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify that specified CWEs were not detected in the GitLab project.

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
cwe_value: '89'
```
