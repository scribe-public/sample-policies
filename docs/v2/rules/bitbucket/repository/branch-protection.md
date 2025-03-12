# Verify Default Branch Protection Setting Is Configured  
**Type:** Rule  
**ID:** `bb-repo-branch-protection`  
**Uses:** `bitbucket/repository/branch-protection@v2/rules`  
**Source:** [v2/rules/bitbucket/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/branch-protection.rego)  
**Labels:** Bitbucket, Repository  

Verify the default branch protection is enabled in the Bitbucket repository.

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
| labels | - platform=bitbucket<br>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| branches | ['main'] |
