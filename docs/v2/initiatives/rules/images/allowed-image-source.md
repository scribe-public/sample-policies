---
sidebar_label: Allowed Main Image Source
title: Allowed Main Image Source
---  
# Allowed Main Image Source  
**Type:** Rule  
**ID:** `images-allowed-image-source`  
**Uses:** `images/allowed-image-source@v2/rules`  
**Source:** [v2/rules/images/allowed-image-source.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/allowed-image-source.yaml)  
**Rego Source:** [allowed-image-source.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/allowed-image-source.rego)  
**Labels:** SBOM, Images  

Ensures the main container image referenced in the SBOM is from an approved source.


:::note 
This rule requires Image SBOM. See [here](https://scribe-security.netlify.app/valint/sbom) for more details.  
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
uses: images/allowed-image-source@v2/rules
with:
  approved_sources:
    - "docker.io/library/*"
    - "docker.io/my_org/*"
```

## Mitigation  
Enforces that the main image comes from a trusted source, reducing the risk of deploying images that are compromised or outdated. This check helps maintain container security by ensuring that only images matching approved source patterns are used.



## Description  
This rule extracts the main image’s name and version from the SBOM evidence and verifies that it originates from an approved source.
It does so by comparing the image name against a list of approved source patterns provided via the configuration (`with.approved_sources`).
The matching is performed using a case-insensitive, anchored regex.

- If one or more approved source patterns are provided and the image name matches at least one pattern, the image is considered compliant.
- If the image name does not match any approved source, or if no approved source patterns are provided, a violation is recorded.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a `metadata.component` section containing the main image’s `name` and `version` fields.
- The approved source patterns must be specified in `with.approved_sources`.


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
| approved_sources | array | False | A list of approved Image source patterns. |

