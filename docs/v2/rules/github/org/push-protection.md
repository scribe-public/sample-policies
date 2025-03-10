# Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories Setting  
**Type:** Rule  
**ID:** `github-org-push-protection`  
**Uses:** `github/org/push-protection@v2/rules`  
**Source:** [v2/rules/github/org/push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection.yaml)  
**Rego Source:** [push-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization.

> Evidence for this rule **IS NOT** required by default but is recommended.


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
desired_value: true
```

