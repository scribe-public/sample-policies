---
sidebar_label: Allowed Namespaces
title: Allowed Namespaces
---  
# Allowed Namespaces  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-namespaces`  
**Source:** [v2/rules/k8s/namespace/white-listed-namespaces.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego Source:** [white-listed-namespaces.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.rego)  
**Labels:** K8s, Namespace  

Verify only namespaces specified in the Allowed List are allowed within the cluster.

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
uses: k8s/namespace/white-listed-namespaces@v2/rules
with:
  namespaces:
    - "my-namespace1"
    - "my-namespace2"
  
```

## Mitigation  
Ensures that only approved namespaces are allowed within the Kubernetes cluster, reducing the risk of unauthorized or misconfigured namespaces.



## Description  
This rule ensures that only namespaces specified in the whitelist are allowed within the Kubernetes cluster.
It performs the following steps:

1. Iterates over the namespaces in the cluster.
2. Checks each namespace against the whitelist specified in the `with.namespaces` configuration.
   - If a namespace is not in the whitelist, the rule flags it as a violation.

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
| namespaces | array | False | A list of allowed namespaces. |

