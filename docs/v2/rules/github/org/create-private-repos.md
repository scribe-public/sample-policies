# Rule: Verify members_can_create_private_repositories setting

**ID**: `github-org-create-private-repos`  
**Uses**: `github/org/create-private-repos@v2/rules  
**Source**: [v2/rules/github/org/create-private-repos.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-private-repos.yaml)  
**Rego Source**: [create-private-repos.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-private-repos.rego)  
**Short Description**: Verify `members_can_create_private_repositories` is configured in the GitHub organization (supported only in GitHub Enterprise).  
**Labels**: GitHub, Organization

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
desired_value: true
```
