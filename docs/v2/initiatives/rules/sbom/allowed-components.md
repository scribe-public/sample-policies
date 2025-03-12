---
sidebar_label: Enforce Allowed SBOM Components
title: Enforce Allowed SBOM Components
---  
# Enforce Allowed SBOM Components  
**Type:** Rule  
**ID:** `sbom-allowed-components`  
**Uses:** `sbom/allowed-components@v2/rules`  
**Source:** [v2/rules/sbom/allowed-components.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/allowed-components.yaml)  
**Rego Source:** [allowed-components.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/allowed-components.rego)  
**Labels:** SBOM, Image  

Verify the artifact contains only allowed components.

:::note 
This rule requires Unsigned SBOM.  
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
| types | ['library', 'operating-system'] |
| allowlist | [] |
