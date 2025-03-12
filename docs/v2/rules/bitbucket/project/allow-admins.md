# Allowed Project Admins  
**Type:** Rule  
**ID:** `bb-project-allowed-project-admins`  
**Uses:** `bitbucket/project/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/project/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-admins.rego)  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket project.

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
| labels | - platform=bitbucket<br>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_admins | [] |
