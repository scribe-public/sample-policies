# Rule: Enable Member Check for GitLab Project

**ID**: `gitlab-project-verify-member_check`  
**Source**: [v2/rules/gitlab/project/member-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/member-check.yaml)  
**Rego File Path**: `member-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify `member_check` is enabled for the GitLab project.

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
