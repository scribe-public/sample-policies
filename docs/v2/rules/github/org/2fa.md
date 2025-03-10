# Rule: Verify two_factor_requirement_enabled setting  
**ID:** `github-org-2fa`  
**Uses:** `github/org/2fa@v2/rules`  
**Source:** [v2/rules/github/org/2fa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/2fa.yaml)  
**Rego Source:** [2fa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/2fa.rego)  
**Labels:** GitHub, Organization  

Verify `two_factor_requirement` is enabled in the GitHub organization.

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
desired_value: false
```

