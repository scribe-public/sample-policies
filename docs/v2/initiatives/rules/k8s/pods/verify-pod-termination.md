---
sidebar_label: Verify Pod Termination
title: Verify Pod Termination
---  
# Verify Pod Termination  
**Type:** Rule  
**ID:** `k8s-pods-verify-pod-termination`  
**Uses:** `k8s/pods/verify-pod-termination@v2/rules`  
**Source:** [v2/rules/k8s/pods/verify-pod-termination.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/verify-pod-termination.yaml)  
**Rego Source:** [verify-pod-termination.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/verify-pod-termination.rego)  
**Labels:** K8s, Pod  

Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene.

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
| labels | - asset_type=pod |

