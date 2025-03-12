# Verify Secret_Scanning_Validity_Checks_Enabled Setting  
**Type:** Rule  
**ID:** `github-org-validity-checks`  
**Uses:** `github/org/validity-checks@v2/rules`  
**Source:** [v2/rules/github/org/validity-checks.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/validity-checks.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_validity_checks` is configured in the GitHub repository.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

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
