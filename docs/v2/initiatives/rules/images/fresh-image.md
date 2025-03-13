---
sidebar_label: Fresh Image
title: Fresh Image
---  
# Fresh Image  
**Type:** Rule  
**ID:** `fresh-image`  
**Uses:** `images/fresh-image@v2/rules`  
**Source:** [v2/rules/images/fresh-image.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/fresh-image.yaml)  
**Rego Source:** [fresh-image.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/fresh-image.rego)  
**Labels:** SBOM, Images  

Verify the image is not older than the specified threshold.

:::note 
This rule requires Image SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
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
Prevents the deployment of outdated container images—which may include unpatched vulnerabilities or outdated dependencies— by enforcing a maximum age limit based on the image's build time.



## Description  
This rule extracts the Image creation timestamp from the SBOM evidence. It searches for a property named "created" 
within the image's metadata (specifically under `metadata.component.properties`). The creation timestamp is parsed using RFC 3339.

The rule compares the current time with the sum of the creation time and the maximum allowed age (by days). If the current time exceeds this sum, 
the rule flags the image as too old and generates a violation with details on the calculated maximum allowed time.

### **Evidence Requirements**
- Evidence must be provided in the `cyclonedx-json` format.
- The SBOM must contain a component under `metadata.component.properties` with a property named "created" in valid RFC 3339 format.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| max_days | integer | True | The maximum allowed age of the image in days. |

