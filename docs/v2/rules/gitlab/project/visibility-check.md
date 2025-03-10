# Rule: Set Visibility Level in GitLab Project

**ID**: `gitlab-project-project-visibility-level`  
**Source**: [v2/rules/gitlab/project/visibility-check.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/visibility-check.yaml)  
**Rego File Path**: `visibility-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the GitLab project's visibility matches the required level.

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
visibility: private
```
