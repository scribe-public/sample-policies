---
sidebar_label: Enforce SBOM License Completeness
title: Enforce SBOM License Completeness
---  
# Enforce SBOM License Completeness  
**Type:** Rule  
**ID:** `sbom-require-complete-license-set`  
**Uses:** `sbom/complete-licenses@v2/rules`  
**Source:** [v2/rules/sbom/complete-licenses.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.yaml)  
**Rego Source:** [complete-licenses.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.rego)  
**Labels:** SBOM, Image  

Verify all dependencies in the artifact have a license.

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

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

