# Rule: Ensure SAST Scanning Passes

**ID**: `gitlab-project-sast-scan-pass`  
**Source YAML**: `sast-scan-pass.yaml`  
**Rego File Path**: `sast-scan-pass.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify SAST scanning is successful for the GitLab project.

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
