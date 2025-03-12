# Apply Scribe Template Policy  
**Type:** Rule  
**ID:** `scribe-template`  
**Uses:** `api/scribe-api@v2/rules`  
**Source:** [v2/rules/api/scribe-api.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.yaml)  
**Labels:** Scribe  

Verify XX using the Scribe API template rule.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Rule requires the Scribe API to be enabled.  
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
| content_body_type | cyclonedx-json |
| predicate_type | https://cyclonedx.org/bom |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| superset | None |
