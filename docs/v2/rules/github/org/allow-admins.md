# Rule: Allowed GitHub Organization Admins

**ID**: `github-orgallowed-admins`  
**Source**: [v2/rules/github/org/allow-admins.yaml](scribe-public/sample-policies.git/v2/rules/github/org/allow-admins.yaml)  
**Rego File Path**: `allow-admins.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify only users in the Allowed List have admin privileges in the GitHub organization.

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
allowed_admins: []
```
