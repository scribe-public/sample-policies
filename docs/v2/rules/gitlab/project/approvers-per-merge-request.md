# Rule: Restrict Approvers Per Merge Request

**ID**: `gitlab-project-approvers-per-merge-request`  
**Uses**: `gitlab/project/approvers-per-merge-request@v2/rules  
**Source**: [v2/rules/gitlab/project/approvers-per-merge-request.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvers-per-merge-request.yaml)  
**Rego Source**: [approvers-per-merge-request.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvers-per-merge-request.rego)  
**Short Description**: Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project.  
**Labels**: Gitlab, Project

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
