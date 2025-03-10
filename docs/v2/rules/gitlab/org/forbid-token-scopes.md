# Rule: Forbid Token Scopes in GitLab Organization

**ID**: `gitlab-org-disallowed-token-scope`  
**Uses**: `gitlab/org/forbid-token-scopes@v2/rules  
**Source**: [v2/rules/gitlab/org/forbid-token-scopes.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.yaml)  
**Rego Source**: [forbid-token-scopes.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.rego)  
**Short Description**: Verify no GitLab organization tokens have disallowed scopes.  
**Labels**: Blueprint, Gitlab, Organization

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
project_scopes:
- write_api
- write_repository
```
