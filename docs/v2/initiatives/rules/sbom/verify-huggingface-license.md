---
sidebar_label: Require Specified SBOM Licenses
title: Require Specified SBOM Licenses
---  
# Require Specified SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-hf-license`  
**Source:** [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-huggingface-license.yaml)  
**Rego Source:** [verify-hf-license.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-hf-license.rego)  
**Labels:** SBOM, Image, Git  

Verify the artifact includes all specified licenses.

:::note 
This rule requires SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::note 
Ensure that the SBOM includes all specified licenses to meet compliance requirements. This rule accesses the Hugging Face API to validate the licenses.  
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
uses: sbom/verify-huggingface-license@v2
with:
  licenses:
    - "MIT"
    - "Apache-2.0"
```

## Mitigation  
Ensures that all specified licenses are included in the SBOM, reducing the risk of legal issues and ensuring compliance with open-source licenses.



## Description  
This rule verifies that the artifact includes all specified licenses.
It performs the following steps:

1. Iterates over the dependencies listed in the SBOM.
2. Checks each dependency for the presence of the specified licenses in the `with.licenses` configuration.
   - If a specified license is missing, the rule flags it as a violation.
3. Accesses the Hugging Face API to validate the licenses.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of dependencies with their licenses.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| licenses | array | True | A list of specified licenses. |

