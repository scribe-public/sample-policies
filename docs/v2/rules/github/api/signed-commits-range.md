# Disallow Unsigned Commits In Time Range  
**Type:** Rule  
**ID:** `signed-commits-range`  
**Uses:** `github/api/signed-commits-range@v2/rules`  
**Source:** [v2/rules/github/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.rego)  
**Labels:** GitHub  

Verify commits in the specified time range are signed.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| access_token |  |
| owner |  |
| repo |  |
| since | None |
| until | None |
| sha | None |
