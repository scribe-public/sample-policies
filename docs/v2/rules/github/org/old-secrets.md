# Verify GitHub Organization Secrets Are Not Too Old  
**Type:** Rule  
**ID:** `github-org-old-secrets`  
**Uses:** `github/org/old-secrets@v2/rules`  
**Source:** [v2/rules/github/org/old-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/old-secrets.rego)  
**Labels:** GitHub, Organization  

Verify secrets in the GitHub organization are not older than the specified threshold.

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
| Parameter | Default |
|-----------|---------|
| max_secret_age | 12 |
