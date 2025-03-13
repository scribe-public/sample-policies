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

:::note 
This rule requires K8s Pod Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures that pods are terminated in a timely manner, preventing lingering resources and maintaining cluster hygiene.



## Description  
This rule verifies that pods in Kubernetes are terminated properly within the specified time frame.
It performs the following steps:

1. Iterates over the pods marked for termination in the cluster.
2. Checks each pod's termination status is present, if such a status is present, the rule flags it as a violation.

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

