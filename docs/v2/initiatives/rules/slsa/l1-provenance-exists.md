---
sidebar_label: Verify Provenance Document Exists
title: Verify Provenance Document Exists
---  
# Verify Provenance Document Exists  
**Type:** Rule  
**ID:** `SLSA.L1`  
**Uses:** `slsa/l1-provenance-exists@v2/rules`  
**Source:** [v2/rules/slsa/l1-provenance-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/l1-provenance-exists.yaml)  
**Rego Source:** [l1-provenance-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/l1-provenance-exists.rego)  
**Help:** https://slsa.dev/spec/v1.0/requirements  
**Labels:** SLSA  

Verify that the Provenance document evidence exists.

:::note 
This rule requires SLSA Provenance. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Mitigation  
Recording comprehensive provenance metadata allows organizations to verify the integrity of the build process and ensures that only authorized and untampered artifacts are deployed.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | slsa |

