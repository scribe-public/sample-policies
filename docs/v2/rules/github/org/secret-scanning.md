# Rule: Verify secret_scanning_enabled_for_new_repositories setting

**ID**: `github-org-secret-scanning`
**Source**: [v2/rules/github/org/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning.yaml)
**Uses**: `github/org/secret-scanning@v2/rules
**Rego Source**: [secret-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning.rego)

**Labels**: GitHub, Organization

**Short Description**: Verify `secret_scanning` is enabled for new repositories in the GitHub organization.

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
desired_value: false
```
