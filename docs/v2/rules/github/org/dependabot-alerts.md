# Rule: Verify dependabot_alerts_enabled_for_new_repositories setting

**ID**: `github-org-dependabot-alerts`
**Source**: [v2/rules/github/org/dependabot-alerts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-alerts.yaml)
**Uses**: `github/org/dependabot-alerts@v2/rules
**Rego File Path**: `dependabot-alerts.rego`

**Labels**: GitHub, Organization

**Short Description**: Verify Dependabot alerts for new repositories are enabled in the GitHub organization.

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
