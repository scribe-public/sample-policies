# Rule: Run SAST Scanning in GitLab Project

**ID**: `gitlab-project-sast-scanning`  
**Source YAML**: `sast-scanning.yaml`  
**Rego File Path**: `sast-scanning.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify SAST scanning is performed for the GitLab project.

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
