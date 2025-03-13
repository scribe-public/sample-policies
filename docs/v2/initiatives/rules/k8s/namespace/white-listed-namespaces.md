---
sidebar_label: Allowed Namespaces
title: Allowed Namespaces
---  
# Allowed Namespaces  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-namespaces`  
**Uses:** `k8s/namespace/white-listed-namespaces@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-namespaces.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego Source:** [white-listed-namespaces.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.rego)  
**Labels:** K8s, Namespace  

Verify only namespaces specified in the Allowed List are allowed within the cluster.

:::note 
This rule requires [Discovery Evidence](https://scribe-security.netlify.app/docs/docs/platforms/discover).  
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
| namespaces | [] |

