# Rule: Disable Committers' Approval for Merge Requests in GitLab

**ID**: `gitlab-project-merge-requests-disable-committers-approval`
**Source**: [v2/rules/gitlab/project/merge-requests-disable-committers-approval.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-requests-disable-committers-approval.yaml)
**Uses**: `gitlab/project/merge-requests-disable-committers-approval@v2/rules
**Rego File Path**: `merge-requests-disable-committers-approval.rego`

**Labels**: Gitlab, Project

**Short Description**: Verify `merge_requests_disable_committers_approval` is set for the GitLab project.

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
merge_requests_disable_committers_approval: false
```
