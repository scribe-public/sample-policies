---
sidebar_label: Enforce SBOM License Completeness
title: Enforce SBOM License Completeness
---  
# Enforce SBOM License Completeness  
**Type:** Rule  
**ID:** `sbom-require-complete-license-set`  
**Source:** [v2/rules/sbom/complete-licenses.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/complete-licenses.yaml)  
**Rego Source:** [complete-licenses.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/complete-licenses.rego)  
**Labels:** SBOM, Image, Git  

Verify all dependencies in the artifact have a license.

:::note 
This rule requires SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
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
uses: sbom/complete-licenses@v2/rules
```

## Mitigation  
Ensures that all dependencies have a complete set of licenses, reducing the risk of legal issues and ensuring compliance with open-source licenses.



## Description  
This rule inspects the CycloneDX SBOM evidence for the artifact to verify that all dependencies have a complete set of licenses.
It performs the following steps:

1. Iterates over the dependencies listed in the SBOM.
2. Checks each dependency for the presence of a license.
   - If a dependency does not have a license, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of dependencies with their licenses.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

