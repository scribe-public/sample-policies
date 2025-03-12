# Require SBOM Existence  
**Type:** Rule  
**ID:** `require-sbom`  
**Uses:** `sbom/require-sbom@v2/rules`  
**Source:** [v2/rules/sbom/require-sbom.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/require-sbom.yaml)  
**Rego Source:** [require-sbom.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/require-sbom.rego)  
**Labels:** SBOM, Blueprint  

Verify the SBOM exists as evidence.

:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
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
| content_body_type | cyclonedx-json |
| signed | False |

