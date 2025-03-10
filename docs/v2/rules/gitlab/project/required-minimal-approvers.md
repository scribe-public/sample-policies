# Rule: Require Minimal Approvers in GitLab Project

**ID**: `gitlab-project-required-minimal-approvers`  
**Source**: [v2/rules/gitlab/project/required-minimal-approvers.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/required-minimal-approvers.yaml)  
**Rego File Path**: `required-minimal-approvers.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the required number of approvers for the GitLab project is met.

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
