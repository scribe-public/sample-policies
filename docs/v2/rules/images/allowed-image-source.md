# Allowed Main Image Source  
**Type:** Rule  
**ID:** `images-allowed-image-source`  
**Uses:** `images/allowed-image-source@v2/rules`  
**Source:** [v2/rules/images/allowed-image-source.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/allowed-image-source.yaml)  
**Rego Source:** [allowed-image-source.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/allowed-image-source.rego)  
**Labels:** SBOM, Images  

Ensures the main container image referenced in the SBOM is from an approved source.


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
| approved_sources | [] |
