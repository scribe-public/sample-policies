---
sidebar_label: Verify build time
title: Verify build time
---  
# Verify build time  
**Type:** Rule  
**ID:** `slsa-build-time`  
**Uses:** `slsa/build-time@v2/rules`  
**Source:** [v2/rules/slsa/build-time.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/build-time.yaml)  
**Rego Source:** [build-time.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/build-time.rego)  
**Labels:** SLSA, Image  

Verify the artifact was created within the specified time window.

:::note 
This rule requires SLSA Provenance.  
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
| start_hour | 8 |
| end_hour | 20 |
| workdays | ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'] |
