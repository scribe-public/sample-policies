---
sidebar_label: Allowed Pods in Namespace
title: Allowed Pods in Namespace
---  
# Allowed Pods in Namespace  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-pod`  
**Source:** [v2/rules/k8s/namespace/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-pod.rego)  
**Labels:** K8s, Namespace  

Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace.

:::note 
This rule requires K8s Namespace Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: k8s/namespace/white-listed-pod@v2/rules
with:
  white_listed_pod:
    - my-pod-1.*
    - my-pod-2.*
```

## Mitigation  
Ensures that only approved pods are running within the Kubernetes namespace, reducing the risk of unauthorized or misconfigured pods.



## Description  
This rule ensures that only pods specified in the whitelist are allowed within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the pods in the namespace.
2. Checks each pod against the whitelist specified in the `with.white_listed_pod` configuration.
   - If a pod is not in the whitelist, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Kubernetes resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=namespace<br/>- platform=k8s |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| white_listed_pod | array | True | A list of allowed pods (supports regex). |

