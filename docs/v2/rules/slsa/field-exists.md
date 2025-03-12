---
sidebar_label: SLSA Field Exists in Provenance Document
title: SLSA Field Exists in Provenance Document
---  
# SLSA Field Exists in Provenance Document  
**Type:** Rule  
**ID:** `slsa-field-exists`  
**Uses:** `slsa/field-exists@v2/rules`  
**Source:** [v2/rules/slsa/field-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.yaml)  
**Rego Source:** [field-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.rego)  
**Labels:** SLSA, Image  

Verify the specified field exists in the provenance document.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
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
