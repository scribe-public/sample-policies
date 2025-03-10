# Rule: Verify dependabot_alerts_enabled_for_new_repositories setting  
**ID:** `github-org-dependabot-alerts`  
**Uses:** `github/org/dependabot-alerts@v2/rules`  
**Source:** [v2/rules/github/org/dependabot-alerts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-alerts.yaml)  
**Rego Source:** [dependabot-alerts.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-alerts.rego)  
**Short Description:** Verify Dependabot alerts for new repositories are enabled in the GitHub organization.  
**Labels:** GitHub, Organization  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
desired_value: false
```

