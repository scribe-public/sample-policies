---
sidebar_label: Verify Namespace Runtime Duration
title: Verify Namespace Runtime Duration
---  
# Verify Namespace Runtime Duration  
**Type:** Rule  
**ID:** `k8s-namespace-verify-namespace-duration`  
**Uses:** `k8s/namespace/verify-namespace-duration@v2/rules`  
**Source:** [v2/rules/k8s/namespace/verify-namespace-duration.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/verify-namespace-duration.yaml)  
**Rego Source:** [verify-namespace-duration.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/verify-namespace-duration.rego)  
**Labels:** K8s, Namespace  

Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits.

:::note 
This rule requires K8s Namespace Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/platforms/discover#k8s-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: k8s/namespace/verify-namespace-duration@v2/rules
with:
  threshold_date: "1970-01-01T00:00:00Z"
```

## Mitigation  
Ensures that namespaces do not exceed their intended lifecycle, maintaining cluster hygiene and resource efficiency.



## Description  
This rule verifies that the duration of namespaces in Kubernetes does not exceed the specified limit.
It performs the following steps:

1. Iterates over the namespaces in the cluster.
2. Checks each namespace's duration against the limit specified in the `with.threshold_date` configuration.
   - If a namespace's duration exceeds the limit, the rule flags it as a violation.

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
| threshold_date | string | False | The threshold date for namespace duration (supports regex). |

