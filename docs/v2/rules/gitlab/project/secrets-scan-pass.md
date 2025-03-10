# Rule: Ensure Secrets Scanning Passes

**ID**: `gitlab-project-secrets-scan-pass`  
**Source**: [v2/rules/gitlab/project/secrets-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.yaml)  
**Rego File Path**: `secrets-scan-pass.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify secrets scanning is successful for the GitLab project.

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
