---
sidebar_label: Disallow dependencies in SLSA Provenance Document
title: Disallow dependencies in SLSA Provenance Document
---  
# Disallow dependencies in SLSA Provenance Document  
**Type:** Rule  
**ID:** `slsa-builder-unallowed-dependencies`  
**Uses:** `slsa/banned-builder-deps@v2/rules`  
**Source:** [v2/rules/slsa/banned-builder-deps.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/banned-builder-deps.yaml)  
**Rego Source:** [banned-builder-deps.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/banned-builder-deps.rego)  
**Labels:** SLSA, Image  

Verify that dependencies in the block list do not appear in the SLSA Proveance document.

:::note 
This rule requires Unsigned SLSA Provenance.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| blocklist | [] |
