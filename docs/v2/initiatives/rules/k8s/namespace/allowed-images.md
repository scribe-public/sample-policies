---
sidebar_label: Allowed Container Images
title: Allowed Container Images
---  
# Allowed Container Images  
**Type:** Rule  
**ID:** `k8s-namespace-blocked-images`  
**Uses:** `k8s/namespace/allowed-images@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-images.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-images.yaml)  
**Rego Source:** [blocked-images.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/blocked-images.rego)  
**Labels:** K8s, Namespace  

Verify only container images specified in the Allowed List run within the Kubernetes namespace.

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
uses: k8s/namespace/allowed-images@v2/rules
with:
  images_to_include:
    - docker.io/my_org/my_image1
    - docker.io/my_org/my_image2  
```

## Mitigation  
Ensures that only approved container images are running within the Kubernetes namespace, reducing the risk of introducing vulnerabilities or unapproved software.



## Description  
This rule ensures that only container images specified in the allowed list are running within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the container images running in the namespace.
2. Checks each image against the allowed list specified in the `with.images_to_include` configuration.
   - If an image is not in the allowed list, the rule flags it as a violation.

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
| images_to_include | array | False | List of allowed container images. |

