---
sidebar_label: Restrict Disallowed Dependencies
title: Restrict Disallowed Dependencies
---  
# Restrict Disallowed Dependencies  
**Type:** Rule  
**ID:** `sbom-disallow-dependencies`  
**Source:** [v2/rules/sbom/blocklist-packages.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/blocklist-packages.yaml)  
**Rego Source:** [blocklist-packages.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/blocklist-packages.rego)  
**Labels:** SBOM, Image, Blueprint  

Verify the number of disallowed dependencies remains below the specified threshold.

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
Rule is scoped by product and target.  
:::  

## Usage example

```yaml
uses: sbom/blocklist-packages@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| blocklist | [] |
| blocklisted_limit | 0 |

