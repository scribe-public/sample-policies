---
sidebar_label: Allowed Namespace Registries
title: Allowed Namespace Registries
---  
# Allowed Namespace Registries  
**Type:** Rule  
**ID:** `k8s-namespace-allowed-registries`  
**Uses:** `k8s/namespace/allowed-registries@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-registries.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/allowed-registries.yaml)  
**Rego Source:** [allowed-registries.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/allowed-registries.rego)  
**Labels:** K8s, Namespace  

Verify container images in Kubernetes namespaces originate from registries in the Allowed List.

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
| allowed_registries | [] |
