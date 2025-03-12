---
sidebar_label: Verify build time
title: Verify build time
---  
# Verify build time  
**Type:** Rule  
**ID:** `slsa-build-time`  
**Uses:** `slsa/build-time@v2/rules`  
**Source:** [v2/rules/slsa/build-time.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.yaml)  
**Rego Source:** [build-time.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.rego)  
**Labels:** SLSA, Image  

Verify the artifact was created within the specified time window.

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
| start_hour | 8 |
| end_hour | 20 |
| workdays | ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'] |
