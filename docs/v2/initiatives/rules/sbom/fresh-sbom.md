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
**Labels:** SBOM  

Verify the SBOM is not older than the specified duration.

:::note 
This rule requires [SBOM](https://scribe-security.netlify.app/docs/docs/valint/sbom).  
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

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_days | 30 |

