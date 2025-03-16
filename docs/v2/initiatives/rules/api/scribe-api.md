---
sidebar_label: Apply Scribe Template Policy
title: Apply Scribe Template Policy
---  
# Apply Scribe Template Policy  
**Type:** Rule  
**ID:** `scribe-template`  
**Source:** [v2/rules/api/scribe-api.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api.yaml)  
**Labels:** Scribe  

Verify XX using the Scribe API template rule.

:::tip 
Rule requires the Scribe API to be enabled.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: api/scribe-api@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| predicate_type | https://cyclonedx.org/bom |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| superset | None |

