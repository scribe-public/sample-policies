# Verify No Cache Usage Exists in Repository  
**Type:** Rule  
**ID:** `github-repo-no-cache-usage`  
**Uses:** `github/repository/no-cache-usage@v2/rules`  
**Source:** [v2/rules/github/repository/no-cache-usage.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-cache-usage.yaml)  
**Rego Source:** [no-cache-usage.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-cache-usage.rego)  
**Labels:** GitHub, Repository  

Verify the GitHub repository has no cache usage.

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
| labels | - platform=github<br>- asset_type=repository |

