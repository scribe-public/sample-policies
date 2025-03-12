# Verify Repository Is Private  
**Type:** Rule  
**ID:** `github-repo-private`  
**Uses:** `github/repository/repo-private@v2/rules`  
**Source:** [v2/rules/github/repository/repo-private.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/repo-private.yaml)  
**Rego Source:** [repo-private.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/repo-private.rego)  
**Labels:** GitHub, Repository  

Verify the GitHub repository is private.

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

