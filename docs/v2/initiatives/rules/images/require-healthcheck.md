---
sidebar_label: Require Healthcheck
title: Require Healthcheck
---  
# Require Healthcheck  
**Type:** Rule  
**ID:** `images-require-healthcheck`  
**Uses:** `images/require-healthcheck@v2/rules`  
**Source:** [v2/rules/images/require-healthcheck.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/require-healthcheck.yaml)  
**Rego Source:** [require-healthcheck.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/require-healthcheck.rego)  
**Labels:** SBOM, Images  

Checks that the container image includes at least one healthcheck property.


:::note 
This rule requires Image SBOM.  
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
Ensures that container images define a HEALTHCHECK instruction so that the runtime environment  can monitor and manage container health. This minimizes the risk of undetected failures at runtime.



## Description  
This rule examines the CycloneDX SBOM evidence for a container image to verify that a healthcheck is defined.
It does so by scanning the `metadata.component.properties` array for any property whose name, when lowercased, 
starts with "imagehealthcheck_". If at least one such property is found, the image is considered compliant; 
otherwise, a violation is recorded indicating a missing healthcheck.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM should include a `metadata.component.properties` array with entries that define healthcheck instructions.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

