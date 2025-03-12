---
sidebar_label: Allowed Base Image
title: Allowed Base Image
---  
# Allowed Base Image  
**Type:** Rule  
**ID:** `images-allowed-base-image`  
**Uses:** `images/allowed-base-image@v2/rules`  
**Source:** [v2/rules/images/allowed-base-image.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/allowed-base-image.yaml)  
**Rego Source:** [allowed-base-image.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/allowed-base-image.rego)  
**Labels:** SBOM, Images  

Verifies that every base image is from an approved source. The rule returns a summary
including the component names and versions of valid base images, or lists the invalid ones.
This rule requires Dockerfile context; for example, run it with:
`valint my_image --base-image Dockerfile`.


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
