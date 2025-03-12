# Disallow Specific Users in SBOM  
**Type:** Rule  
**ID:** `sbom-disallowed-users`  
**Uses:** `images/banned-users@v2/rules`  
**Source:** [v2/rules/images/banned-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/banned-users.yaml)  
**Rego Source:** [banned-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/banned-users.rego)  
**Labels:** SBOM, Image  

Verify specific users are not allowed in an SBOM.

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
This rule scoped by target and product.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| users | ['root'] |
