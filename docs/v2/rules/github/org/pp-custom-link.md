# Verify Secret_Scanning_Push_Protection_Custom_Link_Enabled Setting  
**Type:** Rule  
**ID:** `github-org-pp-custom-link`  
**Uses:** `github/org/pp-custom-link@v2/rules`  
**Source:** [v2/rules/github/org/pp-custom-link.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/pp-custom-link.yaml)  
**Rego Source:** [pp-custom-link.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/pp-custom-link.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

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
| desired_value | False |
