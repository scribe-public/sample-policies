---
sidebar_label: SLSA Field Exists in Provenance Document
title: SLSA Field Exists in Provenance Document
---  
# SLSA Field Exists in Provenance Document  
**Type:** Rule  
**ID:** `slsa-field-exists`  
**Uses:** `slsa/field-exists@v2/rules`  
**Source:** [v2/rules/slsa/field-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/field-exists.yaml)  
**Rego Source:** [field-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/field-exists.rego)  
**Labels:** SLSA, Image  

Verify the specified field exists in the provenance document.

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
| paths | [] |
| violations_threshold | 0 |
