---
sidebar_label: K8s Jailbreak
title: K8s Jailbreak
---  
# K8s Jailbreak  
**Type:** Rule  
**ID:** `k8s-jailbreak`  
**Source:** [v2/rules/generic/k8s-jailbreak.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/generic/k8s-jailbreak.yaml)  
**Rego Source:** [k8s-jailbreak.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/generic/k8s-jailbreak.rego)  
**Labels:** K8s  

Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold

:::note 
This rule requires SARIF Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sarif) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: generic/k8s-jailbreak@v2

## Usage example

```yaml
with: generic/k8s-jailbreak@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |
| target_type | data |

