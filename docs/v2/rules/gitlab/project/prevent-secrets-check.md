# Rule: Enable Secrets Prevention in GitLab Project

**ID**: `gitlab-project-verify-prevent_secrets`  
**Source YAML**: `prevent-secrets-check.yaml`  
**Rego File Path**: `prevent-secrets-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify `prevent_secrets` is enabled for the GitLab project.

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
