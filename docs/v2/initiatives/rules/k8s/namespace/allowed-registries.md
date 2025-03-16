---
sidebar_label: Allowed Namespace Registries
title: Allowed Namespace Registries
---  
# Allowed Namespace Registries  
**Type:** Rule  
**ID:** `k8s-namespace-allowed-registries`  
**Source:** [v2/rules/k8s/namespace/allowed-registries.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.yaml)  
**Rego Source:** [allowed-registries.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.rego)  
**Labels:** K8s, Namespace  

Verify container images in Kubernetes namespaces originate from registries in the Allowed List.

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
uses: k8s/namespace/allowed-registries@v2/rules
with:
  allowed_registries:
    - docker.io/*
    - gcr.io/*
```

## Mitigation  
Ensures that only approved container registries are used within the Kubernetes namespace, reducing the risk of introducing vulnerabilities or unapproved software.



## Description  
This rule ensures that only container images from specified registries are allowed within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the container images running in the namespace.
2. Checks each image's registry against the allowed registries specified in the `with.allowed_registries` configuration.
   - If an image's registry is not in the allowed list, the rule flags it as a violation.

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
| allowed_registries | array | False | A list of allowed container registries Regex patterns. |

