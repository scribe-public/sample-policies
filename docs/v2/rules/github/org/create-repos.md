# Rule: Verify members_can_create_repositories setting  
**ID:** `github-org-create-repos`  
**Uses:** `github/org/create-repos@v2/rules`  
**Source:** [v2/rules/github/org/create-repos.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-repos.yaml)  
**Rego Source:** [create-repos.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-repos.rego)  
**Short Description:** Verify `members_can_create_repositories` is appropriately configured in the GitHub repository.  
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

