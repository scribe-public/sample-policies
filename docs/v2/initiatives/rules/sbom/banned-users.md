---
sidebar_label: Disallow Specific Users in SBOM
title: Disallow Specific Users in SBOM
---  
# Disallow Specific Users in SBOM  
**Type:** Rule  
**ID:** `sbom-disallowed-users`  
**Source:** [v2/rules/sbom/banned-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-users.yaml)  
**Rego Source:** [banned-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/banned-users.rego)  
**Labels:** SBOM, Image  

Verify specific users are not allowed in an SBOM.

:::note 
This rule requires Image SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: sbom/banned-users@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| users | ['root'] |

