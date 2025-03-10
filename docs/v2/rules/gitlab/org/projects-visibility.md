# Rule: Restrict Public Visibility in GitLab Organization

**ID**: `gitlab-org-allowed-visible-projects`  
**Source**: [v2/rules/gitlab/org/projects-visibility.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/org/projects-visibility.yaml)  
**Rego File Path**: `projects-visibility.rego`  

**Labels**: Gitlab, Organization

**Short Description**: Verify only allowed projects in the GitLab organization have public visibility.

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
allowed_public:
- Learn GitLab
- Scribe Gitlab Test
```
