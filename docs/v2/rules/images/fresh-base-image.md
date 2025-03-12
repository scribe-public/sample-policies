# Fresh Base Image  
**Type:** Rule  
**ID:** `images-fresh-base-image`  
**Uses:** `images/fresh-base-image@v2/rules`  
**Source:** [v2/rules/images/fresh-base-image.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-base-image.yaml)  
**Rego Source:** [fresh-base-image.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-base-image.rego)  
**Labels:** SBOM, Images  

Verifies that each base image is not older than the specified threshold (max_days) from its creation date. The rule fails if no base image is found or if any base image exceeds the allowed age. This rule requires Dockerfile context; for example, run it with: `valint my_image --base-image Dockerfile`.


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
| max_days | 183 |
