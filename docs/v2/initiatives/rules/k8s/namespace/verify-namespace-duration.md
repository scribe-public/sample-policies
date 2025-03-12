---
sidebar_label: Verify Namespace Runtime Duration
title: Verify Namespace Runtime Duration
---  
# Verify Namespace Runtime Duration  
**Type:** Rule  
**ID:** `k8s-namespace-verify-namespace-duration`  
**Uses:** `k8s/namespace/verify-namespace-duration@v2/rules`  
**Source:** [v2/rules/k8s/namespace/verify-namespace-duration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-duration.yaml)  
**Rego Source:** [verify-namespace-duration.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-duration.rego)  
**Labels:** K8s, Namespace  

Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits.

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
| threshold_date | 1970-01-01T00:00:00Z |
