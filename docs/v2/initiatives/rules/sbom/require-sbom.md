---
sidebar_label: Require SBOM Existence
title: Require SBOM Existence
---  
# Require SBOM Existence  
**Type:** Rule  
**ID:** `require-sbom`  
**Source:** [v2/rules/sbom/require-sbom.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/require-sbom.yaml)  
**Rego Source:** [require-sbom.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/require-sbom.rego)  
**Labels:** SBOM, Blueprint, Image, Git  

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
uses: sbom/require-sbom@v2

## Usage example

```yaml
with: sbom/require-sbom@v2
```

## Mitigation  
Ensures that an SBOM is present, which is essential for tracking and managing software components and their dependencies.



## Description  
This rule verifies the existence of an SBOM as evidence.
It performs the following steps:

1. Checks for the presence of an SBOM.
   - If the SBOM is missing, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |
| signed | False |

