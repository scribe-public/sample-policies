# Rule: Disallow Banned Approvers

**ID**: `gitlab-project-disallowed-banned-approvers`  
**Source**: [v2/rules/gitlab/project/disallowed-banned-approvers.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/disallowed-banned-approvers.yaml)  
**Rego File Path**: `disallowed-banned-approvers.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify approvers in the GitLab project are not on the banned list.

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
banned_list: []
```
