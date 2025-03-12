---
sidebar_label: Require Specified SBOM Licenses
title: Require Specified SBOM Licenses
---  
# Require Specified SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-hf-license`  
**Uses:** `sbom/verify-huggingface-license@v2/rules`  
**Source:** [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-huggingface-license.yaml)  
**Rego Source:** [verify-hf-license.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-hf-license.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all specified licenses.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| licenses | [] |
