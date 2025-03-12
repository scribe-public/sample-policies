# Disallow Unsigned Commits  
**Type:** Rule  
**ID:** `git-disallow-unsigned-commits`  
**Uses:** `git/no-unsigned-commits@v2/rules`  
**Source:** [v2/rules/git/no-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.yaml)  
**Rego Source:** [no-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.rego)  
**Labels:** Git  

Verify all commits are signed.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 
:::info  
This rule scoped by product and target.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

