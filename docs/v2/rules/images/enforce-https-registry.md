---
sidebar_label: 4.2.1 Registry Connection HTTPS
title: 4.2.1 Registry Connection HTTPS
---  
# 4.2.1 Registry Connection HTTPS  
**Type:** Rule  
**ID:** `images-registry-https-check`  
**Uses:** `images/enforce-https-registry@v2/rules`  
**Source:** [v2/rules/images/enforce-https-registry.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/enforce-https-registry.yaml)  
**Rego Source:** [enforce-https-registry.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/enforce-https-registry.rego)  
**Labels:** Registry, Images  

Checks if the container's registry scheme is HTTPS by looking for a
property named 'registry_scheme' with value 'https'. If none found,
the rule fails, indicating a non-HTTPS registry.


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
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['product', 'target'] |

