# Require Signed Container Image  
**Type:** Rule  
**ID:** `images-require-signed-image`  
**Uses:** `images/image-signed@v2/rules`  
**Source:** [v2/rules/images/image-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/image-signed.yaml)  
**Rego Source:** [image-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/image-signed.rego)  
**Labels:** Images, Blueprint  

Enforces that container images (target_type=container) are cryptographically signed.
Allows you to skip checks for certain images matching skip_regex, and optionally
ensures that the signer's identity matches specified emails or common-names.


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
| target_type | container |
| signed | False |
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| skip_image_regex | ['.*alpine.*'] |
| identity | {'emails': [], 'common-names': []} |
