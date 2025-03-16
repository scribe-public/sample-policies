---
sidebar_label: Enforce SBOM Dependencies
title: Enforce SBOM Dependencies
---  
# Enforce SBOM Dependencies  
**Type:** Rule  
**ID:** `sbom-required-dependencies`  
**Source:** [v2/rules/sbom/required-packages.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.yaml)  
**Rego Source:** [required-packages.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all required dependencies specified as a list of PURLs.

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
uses: sbom/required-packages@v2
with:
  required_pkgs:
    - "pkg:maven/org.apache.commons/commons-lang3@3.9"
    - "pkg:npm/lodash@4.17.15"
  violations_limit: 0
```

## Mitigation  
Ensures that all required dependencies are included in the SBOM, reducing the risk of missing critical components and ensuring compliance with dependency requirements.



## Description  
This rule verifies that the artifact includes all required dependencies as specified.
It performs the following steps:

1. Iterates over the dependencies listed in the SBOM.
2. Checks each dependency against the required dependencies specified in the `with.required_pkgs` configuration.
   - If a required dependency is missing, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of dependencies.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| required_pkgs | array | True | A list of required dependencies specified as PURLs. |
| violations_limit | integer | False | The maximum number of allowed violations. |

