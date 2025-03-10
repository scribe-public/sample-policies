# Rule: Restrict Public Visibility in GitLab Organization

**ID**: `gitlab-org-allowed-visible-projects`
**Source**: [v2/rules/gitlab/org/projects-visibility.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/projects-visibility.yaml)
**Uses**: `gitlab/org/projects-visibility@v2/rules
**Rego Source**: [projects-visibility.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/projects-visibility.rego)

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
