---
sidebar_label: Verify that artifact has no disallowed builder dependencies
title: Verify that artifact has no disallowed builder dependencies
---  
# Verify that artifact has no disallowed builder dependencies  
**Type:** Rule  
**ID:** `slsa-verify-byproducts`  
**Source:** [v2/rules/slsa/verify-byproducts.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/verify-byproducts.yaml)  
**Rego Source:** [verify-byproducts.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/slsa/verify-byproducts.rego)  
**Labels:** SLSA, Image  

Verify the artifact has no disallowed builder dependencies.

:::note 
This rule requires SLSA Provenance. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: slsa/verify-byproducts@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| byproducts | [] |

