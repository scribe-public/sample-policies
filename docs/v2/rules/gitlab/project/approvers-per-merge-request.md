# Rule: Restrict Approvers Per Merge Request

**ID**: `gitlab-project-approvers-per-merge-request`  
**Source YAML**: `approvers-per-merge-request.yaml`  
**Rego File Path**: `approvers-per-merge-request.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project.

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
disable_overriding_approvers_per_merge_request: false
```
