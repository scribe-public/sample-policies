# Verify Image Labels  
**Type:** Rule  
**ID:** `image-labels`  
**Uses:** `images/verify-labels@v2/rules`  
**Source:** [v2/rules/images/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.rego)  
**Labels:** SBOM, Images  

Verify specified labels key-value pairs exist in the image.


## Mitigation  
Ensures that all required metadata labels are present with the expected values, which is crucial for traceability, auditing, and compliance with container security standards.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Description  
This rule checks the CycloneDX SBOM evidence for the container image to verify that each 
required label (as defined in the `with.labels` parameter) exists with the correct value.

1. The rule iterates over the list of required labels provided in the `with.labels` configuration.
2. For each required label, it examines the `metadata.component.properties` array in the SBOM.
3. It looks for a property where the name starts with "label_" and ends with the required label key, and
   where the property value matches the expected value.
4. If such a property is not found, a violation is recorded with the missing label and expected value details.

**Evidence Requirements:**
- Evidence must be provided in the `cyclonedx-json` format.
- The SBOM should include a `metadata.component.properties` array that contains label information.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| labels | [] |
