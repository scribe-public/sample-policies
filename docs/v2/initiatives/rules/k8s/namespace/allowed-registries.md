---
sidebar_label: Allowed Namespace Registries
title: Allowed Namespace Registries
---  
# Allowed Namespace Registries  
**Type:** Rule  
**ID:** `k8s-namespace-allowed-registries`  
**Uses:** `k8s/namespace/allowed-registries@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-registries.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.yaml)  
**Rego Source:** [allowed-registries.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.rego)  
**Labels:** K8s, Namespace  

Verify container images in Kubernetes namespaces originate from registries in the Allowed List.

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
| labels | - asset_type=namespace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_registries | [] |

