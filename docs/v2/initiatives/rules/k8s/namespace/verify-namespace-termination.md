---
sidebar_label: Verify Namespace Termination
title: Verify Namespace Termination
---  
# Verify Namespace Termination  
**Type:** Rule  
**ID:** `k8s-namespace-verify-namespace-termination`  
**Uses:** `k8s/namespace/verify-namespace-termination@v2/rules`  
**Source:** [v2/rules/k8s/namespace/verify-namespace-termination.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-termination.yaml)  
**Rego Source:** [verify-namespace-termination.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-termination.rego)  
**Labels:** K8s, Namespace  

Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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
| namespaces | ['.*'] |
