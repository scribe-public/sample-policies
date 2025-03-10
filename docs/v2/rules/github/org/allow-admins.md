# Allowed GitHub Organization Admins  
**Type:** Rule  
**ID:** `github-orgallowed-admins`  
**Uses:** `github/org/allow-admins@v2/rules`  
**Source:** [v2/rules/github/org/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/allow-admins.rego)  
**Labels:** GitHub, Organization  

Verify only users in the Allowed List have admin privileges in the GitHub organization.

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
| allowed_admins | [] |
