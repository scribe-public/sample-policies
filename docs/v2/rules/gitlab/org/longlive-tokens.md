# Rule: Forbid Long-Lived Tokens in GitLab Organization

**ID**: `gitlab-org-token-excessive-lifespan`
**Source**: [v2/rules/gitlab/org/longlive-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.yaml)
**Uses**: `gitlab/org/longlive-tokens@v2/rules
**Rego Source**: [longlive-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.rego)

**Labels**: Blueprint, Gitlab, Organization

**Short Description**: Verify no GitLab organization tokens have an excessively long lifespan.

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
exiring_in_days: 365
```
