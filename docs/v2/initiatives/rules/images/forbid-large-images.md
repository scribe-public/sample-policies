---
sidebar_label: Forbid Large Images
title: Forbid Large Images
---  
# Forbid Large Images  
**Type:** Rule  
**ID:** `images-project-large-image`  
**Uses:** `images/forbid-large-images@v2/rules`  
**Source:** [v2/rules/images/forbid-large-images.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/forbid-large-images.yaml)  
**Rego Source:** [forbid-large-images.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/forbid-large-images.rego)  
**Labels:** SBOM, Images  

Verify the image size is below the specified threshold.


## Mitigation  
Prevents the deployment of overly large container images, which helps control resource usage, reduces the attack surface by limiting unnecessary code and dependencies, and minimizes potential vulnerabilities.


:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Description  
This rule inspects the CycloneDX SBOM evidence for container images. It searches through the SBOM's components
to locate a component belonging to the "layer" group where a property named "size" is defined. The rule specifically
looks for the size property when the associated "index" property is "0" (which typically represents the overall image size).
The extracted size is then converted to a numeric value and compared against the maximum size specified in the rule's configuration (`max_size`).

- If the image size is less than or equal to the specified `max_size`, the rule passes and the image is considered acceptable.
- If the image size exceeds the threshold, a violation is recorded with a message indicating the actual image size and the maximum allowed size.

### **Evidence Requirements**

- Evidence must be provided in the `cyclonedx-json` format.
- The SBOM must include a component in the "layer" group with a "size" property, and an "index" property set to "0".


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_size | 77819980 |
