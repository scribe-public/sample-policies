# Rule: Verify dependabot_security_updates_enabled_for_new_repositories setting

**ID**: `github-org-dependabot-security-updates`  
**Source**: [v2/rules/github/org/dependabot-security-updates.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-security-updates.yaml)  
**Rego File Path**: `dependabot-security-updates.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify Dependabot security updates for new repositories are configured in the GitHub organization.

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
