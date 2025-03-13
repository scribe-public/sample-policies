---
sidebar_label: Verify that provenance is authenticated
title: Verify that provenance is authenticated
---  
# Verify that provenance is authenticated  
**Type:** Rule  
**ID:** `SLSA.L2`  
**Uses:** `slsa/l2-provenance-authenticated@v2/rules`  
**Source:** [v2/rules/slsa/l2-provenance-authenticated.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/l2-provenance-authenticated.yaml)  
**Rego Source:** [l2-provenance-authenticated.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/l2-provenance-authenticated.rego)  
**Help:** https://slsa.dev/spec/v1.0/requirements  
**Labels:** SLSA  

Verify the artifact is signed.

:::note 
This rule requires Signed SLSA Provenance. See [here](https://scribe-security.netlify.app/valint/help/valint_slsa) for more details.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS** required by default.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Mitigation  
Cryptographic authentication prevents tampering with provenance data, ensuring that only valid and secure build information is used to establish the integrity of the software supply chain.



## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | True |
| content_body_type | slsa |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| identity | `{'common-names': [], 'emails': []}` |

