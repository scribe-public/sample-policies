# Enforce Allowed SBOM Components  
**Type:** Rule  
**ID:** `sbom-allowed-components`  
**Uses:** `sbom/allowed-components@v2/rules`  
**Source:** [v2/rules/sbom/allowed-components.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/allowed-components.yaml)  
**Rego Source:** [allowed-components.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/allowed-components.rego)  
**Labels:** SBOM, Image  

Verify the artifact contains only allowed components.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| types | ['library', 'operating-system'] |
| allowlist | [] |
