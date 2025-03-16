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
This rule requires K8s Pod Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: k8s/pods/verify-pod-duration@v2/rules
with:
  max_days: 30
```

## Mitigation  
Ensures that pods do not exceed their intended lifecycle, maintaining cluster hygiene and resource efficiency.



## Description  
This rule verifies that the duration of pods in Kubernetes does not exceed the specified limit.
It performs the following steps:

1. Iterates over the pods in the cluster.
2. Checks each pod's duration against the limit specified in the `with.max_days` configuration.
   - If a pod's duration exceeds the limit, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Kubernetes resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=pod<br/>- platform=k8s |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| max_days | integer | False | The maximum allowed duration for pods in days. |

