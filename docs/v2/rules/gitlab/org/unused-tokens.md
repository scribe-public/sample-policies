# Rule: Forbid Unused Tokens in GitLab Organization

**ID**: `gitlab-org-unused-tokens`
**Source**: [v2/rules/gitlab/org/unused-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/unused-tokens.yaml)
**Uses**: `gitlab/org/unused-tokens@v2/rules
**Rego File Path**: `unused-tokens.rego`

**Labels**: Gitlab, Organization

**Short Description**: Verify there are no unused GitLab organization tokens.

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
unused_for_days: 90
```
