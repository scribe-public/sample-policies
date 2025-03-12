# Verify that artifact was created by the specified builder  
**Type:** Rule  
**ID:** `slsa-verify-builder`  
**Uses:** `slsa/verify-builder@v2/rules`  
**Source:** [v2/rules/slsa/verify-builder.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-builder.yaml)  
**Rego Source:** [verify-builder.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-builder.rego)  
**Labels:** SLSA, Image  

Verify the artifact was created by the specified builder.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::info  
This rule scoped by pipeline and product.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['pipeline', 'product'] |
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| id | {{ .Env.HOSTNAME }} |
