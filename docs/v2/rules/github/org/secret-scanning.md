# Rule: Verify secret_scanning_enabled_for_new_repositories setting  
**ID:** `github-org-secret-scanning`  
**Uses:** `github/org/secret-scanning@v2/rules`  
**Source:** [v2/rules/github/org/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning.yaml)  
**Rego Source:** [secret-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning.rego)  
**Short Description:** Verify `secret_scanning` is enabled for new repositories in the GitHub organization.  
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

