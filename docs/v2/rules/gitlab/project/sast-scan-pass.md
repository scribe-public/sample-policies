# Rule: Ensure SAST Scanning Passes

**ID**: `gitlab-project-sast-scan-pass`
**Source**: [v2/rules/gitlab/project/sast-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/sast-scan-pass.yaml)
**Uses**: `gitlab/project/sast-scan-pass@v2/rules
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
