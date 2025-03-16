---
sidebar_label: Restrict Disallowed SBOM Licenses
title: Restrict Disallowed SBOM Licenses
---  
# Restrict Disallowed SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-disallowed-licenses`  
**Source:** [v2/rules/sbom/banned-licenses.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-licenses.yaml)  
**Rego Source:** [banned-licenses.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-licenses.rego)  
**Labels:** SBOM, Image, Git  

Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold.

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
uses: sbom/banned-licenses@v2/rules
with:
  blocklist:
    - "GPL-2.0"
    - "GPL-3.0"
  blocklisted_limit: 1
```

## Mitigation  
Ensures that the software components used in the artifact comply with organizational policies by restricting the use of disallowed licenses. This helps prevent legal and compliance issues that may arise from using components with incompatible or risky licenses.



## Description  
This rule inspects the CycloneDX SBOM evidence for the artifact to verify that the number of components with disallowed licenses
remains below the specified threshold. It performs the following steps:

1. Iterates over the components listed in the SBOM.
2. Checks each component's license against the blocklist provided in the `with.blocklist` configuration.
3. Counts the number of components with disallowed licenses.
   - If the count exceeds the specified `with.blocklisted_limit`, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of components with their licenses.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| blocklist | array | False | A list of disallowed licenses. |
| blocklisted_limit | integer | False | The maximum number of components with disallowed licenses allowed. |

