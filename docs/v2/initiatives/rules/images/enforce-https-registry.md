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

Checks if the container's registry scheme is HTTPS


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Description  
This rule examines the CycloneDX SBOM evidence for a container image to verify that the registry connection
is secure. It does so by scanning the `metadata.component.properties` array for a property named 
'registry_scheme'. If the value of this property is exactly 'https', the rule passes; otherwise, it fails,
indicating that the image may have been pulled from an insecure registry.

**Evidence Requirements:**

- Evidence must be provided in the CycloneDX JSON format.
- The SBOM should include a `metadata.component.properties` array with an entry for 'registry_scheme'.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['product', 'target'] |

