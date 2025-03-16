---
sidebar_label: Allowed Pods
title: Allowed Pods
---  
# Allowed Pods  
**Type:** Rule  
**ID:** `k8s-pods-white-listed-pod`  
**Source:** [v2/rules/k8s/pods/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/pods/white-listed-pod.rego)  
**Labels:** K8s, Pod  

Verify only pods explicitly listed in the Allowed List are allowed to run.

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
uses: k8s/pods/white-listed-pod@v2
with:
  white_listed_pod:
    - my-pod-1.*
    - my-pod-2.*
  verify_namespaces:
    - ".*"
```

## Mitigation  
Ensures that only approved pods are running within the Kubernetes cluster, reducing the risk of unauthorized or misconfigured pods.



## Description  
This rule ensures that only pods specified in the whitelist are allowed to run within the Kubernetes cluster.
It performs the following steps:

1. Iterates over the pods in the cluster.
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
| labels | - asset_type=pod<br/>- platform=k8s |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| white_listed_pod | array | True | A list of allowed pods (supports regex). |
| verify_namespaces | array | True | A list of namespaces to verify (supports regex). |

