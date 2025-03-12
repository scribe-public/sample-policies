---
sidebar_label: Enforce SBOM Dependencies
title: Enforce SBOM Dependencies
---  
# Enforce SBOM Dependencies  
**Type:** Rule  
**ID:** `sbom-required-dependencies`  
**Uses:** `sbom/required-packages@v2/rules`  
**Source:** [v2/rules/sbom/required-packages.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.yaml)  
**Rego Source:** [required-packages.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all required dependencies.

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
| required_pkgs | [] |
| violations_limit | 0 |
