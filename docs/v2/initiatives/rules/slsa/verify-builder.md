---
sidebar_label: Verify that artifact was created by the specified builder
title: Verify that artifact was created by the specified builder
---  
# Verify that artifact was created by the specified builder  
**Type:** Rule  
**ID:** `slsa-verify-builder`  
**Uses:** `slsa/verify-builder@v2/rules`  
**Source:** [v2/rules/slsa/verify-builder.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/verify-builder.yaml)  
**Rego Source:** [verify-builder.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/verify-builder.rego)  
**Labels:** SLSA, Image  

Verify the artifact was created by the specified builder.

:::note 
This rule requires SLSA Provenance.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::info  
Rule is scoped by pipeline and product.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['pipeline', 'product'] |
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| id | `{{ .Env.HOSTNAME }}` |
