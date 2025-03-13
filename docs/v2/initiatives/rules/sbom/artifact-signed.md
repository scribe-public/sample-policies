---
sidebar_label: Require SBOM Signature
title: Require SBOM Signature
---  
# Require SBOM Signature  
**Type:** Rule  
**ID:** `sbom-signed`  
**Uses:** `sbom/artifact-signed@v2/rules`  
**Source:** [v2/rules/sbom/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/artifact-signed.rego)  
**Labels:** SBOM, Blueprint, Git  

Verify the SBOM is signed.

:::note 
This rule requires Signed [SBOM](https://scribe-security.netlify.app/docs/valint/sbom).  
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

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |
| signed | True |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| identity | `{'common-names': [], 'emails': []}` |

