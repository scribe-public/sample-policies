---
sidebar_label: Require Image Labels
title: Require Image Labels
---  
# Require Image Labels  
**Type:** Rule  
**ID:** `required-image-labels`  
**Uses:** `images/verify-labels-exist@v2/rules`  
**Source:** [v2/rules/images/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/verify-labels-exist.yaml)  
**Rego Source:** [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/verify-labels-exist.rego)  
**Labels:** SBOM, Images  

Verify the image has the specified labels.

:::note 
This rule requires [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom).  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures that container images include all required metadata labels, which are essential for traceability, auditing, and enforcing compliance with security and operational standards.



## Description  
This rule checks the CycloneDX SBOM evidence for the container image to verify that each required label 
(as defined in the `with.labels` parameter) exists with the correct value.

1. The rule iterates over the list of required labels provided in the `with.labels` configuration.
2. For each required label, it examines the `metadata.component.properties` array in the SBOM.
3. It looks for a property where the name starts with "label_" and ends with the required label key, and
   where the property value matches the expected value.
4. If such a property is not found, a violation is recorded with the missing label and expected value details.

### **Evidence Requirements**
- Evidence must be provided in the `cyclonedx-json` format.
- The SBOM should include a `metadata.component.properties` array that contains label information.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| labels | array | False | A list of required labels. |

