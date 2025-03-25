---
sidebar_label: Require SBOM Existence
title: Require SBOM Existence
---  
# Require SBOM Existence  
**Type:** Rule  
**ID:** `require-sbom`  
**Source:** [v2/rules/sbom/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/evidence-exists.rego)  
**Labels:** SBOM, Blueprint  

Verify the SBOM exists as evidence.

:::note 
This rule requires SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
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

## Usage example

```yaml
uses: sbom/evidence-exists@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |
| signed | False |

