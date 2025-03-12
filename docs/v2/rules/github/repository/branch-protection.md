# Verify Branch Protection Setting  
**Type:** Rule  
**ID:** `github-repo-branch-protection`  
**Uses:** `github/repository/branch-protection@v2/rules`  
**Source:** [v2/rules/github/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-protection.rego)  
**Labels:** GitHub, Repository  

Verify branch protection is configured in the GitHub repository.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_protected | True |
| branches | ['main', 'master'] |
