---
sidebar_label: Allowed Base Image
title: Allowed Base Image
---  
# Allowed Base Image  
**Type:** Rule  
**ID:** `images-allowed-base-image`  
**Source:** [v2/rules/images/allowed-base-image.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/allowed-base-image.yaml)  
**Rego Source:** [allowed-base-image.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/allowed-base-image.rego)  
**Labels:** SBOM, Images  

Verifies that every base image is from an approved source. The rule returns a summary including the component names and versions of valid base images, or lists the invalid ones. This rule requires Dockerfile context; for example, run it with: `valint my_image --base-image Dockerfile`.

:::note 
This rule requires Image SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
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

## Usage example

```yaml
uses: images/allowed-base-image@v2
with:
  approved_sources:
    - "docker.io/library/*"
    - "docker.io/my_org/*"
```

## Mitigation  
Ensures that only trusted base images are used in container builds, reducing the risk of deploying compromised or outdated images. This check mitigates vulnerabilities by enforcing that each base image matches an approved source pattern.


## Description  
This rule examines the SBOM evidence for a container image, focusing on components in the "container" group that represent base images.
A base image is identified by the presence of a property whose name ends with "isbaseimage" (case-insensitive) and whose value is "true".
For each detected base image, the rule verifies that its name matches one of the approved source patterns defined in the configuration 
(via `with.approved_sources`). If a base image does not match any of the approved patterns, it is flagged as invalid. If no base image data 
is found, a violation is recorded indicating that the necessary base image information is missing.

**Evidence Requirements:**

- The SBOM evidence must be provided in the `cyclonedx-json` format.
- The SBOM should include a `metadata.component.properties` array containing properties that identify base images.
- The approved source patterns must be specified in the `with.approved_sources` parameter.

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
| approved_sources | array | False | A list of approved base image  pattern. |

