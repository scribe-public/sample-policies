---
sidebar_label: Allowed Container Images
title: Allowed Container Images
---  
# Allowed Container Images  
**Type:** Rule  
**ID:** `k8s-namespace-blocked-images`  
**Uses:** `k8s/namespace/allowed-images@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-images.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-images.yaml)  
**Rego Source:** [blocked-images.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/blocked-images.rego)  
**Labels:** K8s, Namespace  

Verify only container images specified in the Allowed List run within the Kubernetes namespace.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=namespace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| images_to_include | [] |
