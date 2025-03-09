# Rule: Restrict Selective Code Owner Removals in GitLab

**ID**: `gitlab-project-selective-code-owner-removals`  
**Source YAML**: `selective-code-owner-removals.yaml`  
**Rego File Path**: `selective-code-owner-removals.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify `selective_code_owner_removals` is set for the GitLab project.

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
selective_code_owner_removals: true
```
