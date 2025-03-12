---
sidebar_label: Allowed Pods
title: Allowed Pods
---  
# Allowed Pods  
**Type:** Rule  
**ID:** `k8s-pods-white-listed-pod`  
**Uses:** `k8s/pods/white-listed-pod@v2/rules`  
**Source:** [v2/rules/k8s/pods/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/white-listed-pod.rego)  
**Labels:** K8s, Pod  

Verify only pods explicitly listed in the Allowed List are allowed to run.

:::note 
This rule requires Discovery Evidence.  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| white_listed_pod | [] |
| verify_namespaces | ['.*'] |
