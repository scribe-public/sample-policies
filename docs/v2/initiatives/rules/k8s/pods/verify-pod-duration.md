---
sidebar_label: Verify Pod Runtime Duration
title: Verify Pod Runtime Duration
---  
# Verify Pod Runtime Duration  
**Type:** Rule  
**ID:** `k8s-pods-verify-pod-duration`  
**Uses:** `k8s/pods/verify-pod-duration@v2/rules`  
**Source:** [v2/rules/k8s/pods/verify-pod-duration.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/verify-pod-duration.yaml)  
**Rego Source:** [verify-pod-duration.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/verify-pod-duration.rego)  
**Labels:** K8s, Pod  

Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits.

:::note 
This rule requires [Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover).  
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
| max_days | 30 |

