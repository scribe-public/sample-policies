---
sidebar_label: Fresh Base Image
title: Fresh Base Image
---  
# Fresh Base Image  
**Type:** Rule  
**ID:** `images-fresh-base-image`  
**Uses:** `images/fresh-base-image@v2/rules`  
**Source:** [v2/rules/images/fresh-base-image.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/fresh-base-image.yaml)  
**Rego Source:** [fresh-base-image.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/fresh-base-image.rego)  
**Labels:** SBOM, Images  

Verifies that each base image is not older than the specified threshold (max_days) from its creation date.


:::note 
This rule requires Unsigned Image SBOM.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by target and product.  
:::  

## Mitigation  
Ensures that container images are built on up-to-date base images, reducing the risk of deploying images with outdated layers that may contain unpatched vulnerabilities or deprecated components. This check prevents the use of stale base images, thereby enhancing overall container security.



## Description  
This rule processes the CycloneDX SBOM evidence for a container image to verify that its base image remains fresh. 
It identifies base image components by locating properties whose names end with "isbaseimage" (case-insensitive) and have a value of "true". 
The rule then extracts the "created" timestamp from these components and calculates the image’s age against the allowed threshold specified in `with.max_days`. 
If any base image is older than the allowed age, or if no base image data is found, the rule records a violation.

**Evidence Requirements:**
- Evidence must be provided in CycloneDX JSON format.
- The SBOM should include a `metadata.component.properties` array with properties for base image identification and creation timestamp.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_days | 183 |
