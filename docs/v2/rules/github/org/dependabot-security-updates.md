# Verify dependabot_security_updates_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependabot-security-updates`  
**Uses:** `github/org/dependabot-security-updates@v2/rules`  
**Source:** [v2/rules/github/org/dependabot-security-updates.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-security-updates.yaml)  
**Rego Source:** [dependabot-security-updates.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependabot-security-updates.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot security updates for new repositories are configured in the GitHub organization.

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
