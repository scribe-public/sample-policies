---
sidebar_label: Restrict Disallowed SBOM Licenses
title: Restrict Disallowed SBOM Licenses
---  
# Restrict Disallowed SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-disallowed-licenses`  
**Uses:** `sbom/banned-licenses@v2/rules`  
**Source:** [v2/rules/sbom/banned-licenses.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-licenses.yaml)  
**Rego Source:** [banned-licenses.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-licenses.rego)  
**Labels:** SBOM, Image  

Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold.

:::note 
This rule requires SBOM.  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| blocklist | [] |
| blocklisted_limit | 0 |
