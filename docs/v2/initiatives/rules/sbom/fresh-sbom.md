---
sidebar_label: Enforce SBOM Freshness
title: Enforce SBOM Freshness
---  
# Enforce SBOM Freshness  
**Type:** Rule  
**ID:** `fresh-sbom`  
**Uses:** `sbom/fresh-sbom@v2/rules`  
**Source:** [v2/rules/sbom/fresh-sbom.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/fresh-sbom.yaml)  
**Rego Source:** [fresh-sbom.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/fresh-sbom.rego)  
**Labels:** SBOM, Image, Git  

Verify the SBOM is not older than the specified duration.

:::note 
This rule requires SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/valint/sbom) for more details.  
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
uses: sbom/fresh-sbom@v2/rules
with:
  max_days: 30
```

## Mitigation  
Ensures that the SBOM is up-to-date, reducing the risk of outdated information and ensuring accurate tracking of components.



## Description  
This rule inspects the CycloneDX SBOM evidence for the artifact to verify that it is not older than the specified duration.
It performs the following steps:

1. Checks the creation date of the SBOM.
2. Compares the creation date against the maximum allowed age specified in the `with.max_days` configuration.
   - If the SBOM is older than the allowed duration, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a creation date.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| max_days | integer | False | The maximum allowed age of the SBOM in days. |

