# Verify Secret_Scanning_Validity_Checks_Enabled Setting  
**Type:** Rule  
**ID:** `github-org-validity-checks`  
**Uses:** `github/org/validity-checks@v2/rules`  
**Source:** [v2/rules/github/org/validity-checks.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_validity_checks` is configured in the GitHub repository.

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

