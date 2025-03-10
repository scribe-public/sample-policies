# Limit Admin Number in GitHub Organization  
**Type:** Rule  
**ID:** `github-org-max-admins`  
**Uses:** `github/org/max-admins@v2/rules`  
**Source:** [v2/rules/github/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/max-admins.rego)  
**Labels:** Blueprint, GitHub, Organization  

Verify the maximum number of GitHub organization admins is restricted.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br>- asset_type=organization |

## Rule Parameters (`with`)  
```yaml
max_admins: 0
```

