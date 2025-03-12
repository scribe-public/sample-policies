---
sidebar_label: Allowed Namespaces
title: Allowed Namespaces
---  
# Allowed Namespaces  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-namespaces`  
**Uses:** `k8s/namespace/white-listed-namespaces@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-namespaces.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego Source:** [white-listed-namespaces.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-namespaces.rego)  
**Labels:** K8s, Namespace  

Verify only namespaces specified in the Allowed List are allowed within the cluster.

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
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=namespace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| namespaces | [] |
