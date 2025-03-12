# Require Healthcheck  
**Type:** Rule  
**ID:** `images-require-healthcheck`  
**Uses:** `images/require-healthcheck@v2/rules`  
**Source:** [v2/rules/images/require-healthcheck.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/require-healthcheck.yaml)  
**Rego Source:** [require-healthcheck.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/require-healthcheck.rego)  
**Labels:** SBOM, Images  

Checks that the container image includes at least one healthcheck property.
otherwise, it fails with a violation.


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

