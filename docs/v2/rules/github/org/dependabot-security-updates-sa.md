# Verify dependabot_security_updates setting in security_and_analysis  
** Type:** Rule  
**ID:** `github-org-dependabot-security-updates-sa`  
**Uses:** `github/org/dependabot-security-updates-sa@v2/rules`  
**Source:** [v2/rules/github/org/dependabot-security-updates-sa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-security-updates-sa.yaml)  
**Rego Source:** [dependabot-security-updates-sa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-security-updates-sa.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot security updates are configured in the GitHub organization.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

