# Rule: Ensure Active Projects in GitLab Organization

**ID**: `gitlab-org-inactive-projects`  
**Source**: [v2/rules/gitlab/org/inactive-projects.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/inactive-projects.yaml)  
**Rego File Path**: `inactive-projects.rego`  

**Labels**: Gitlab, Organization

**Short Description**: Verify no GitLab organization projects are inactive.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=gitlab
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
inactive_for_days: 90
```
