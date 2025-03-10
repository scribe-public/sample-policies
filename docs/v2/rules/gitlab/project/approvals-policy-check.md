# Rule: Merge approval policy check for GitLab project

**ID**: `gitlab-project-merge-approval`  
**Source**: [v2/rules/gitlab/project/approvals-policy-check.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/approvals-policy-check.yaml)  
**Rego File Path**: `approvals-policy-check.rego`  

**Labels**: Blueprint, Gitlab, Project

**Short Description**: Verify the project's merge approval policy complies with requirements.

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
name: All Members
approvals_required_min: 2
```
