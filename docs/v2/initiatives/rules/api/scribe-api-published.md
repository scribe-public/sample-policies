---
sidebar_label: Scribe Published Policy
title: Scribe Published Policy
---  
# Scribe Published Policy  
**Type:** Rule  
**ID:** `scribe-published-policy`  
**Source:** [v2/rules/api/scribe-api-published.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-published.yaml)  
**Rego Source:** [scribe-api-published.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-published.rego)  
**Labels:** Scribe  

Verify image Scribe Publish flag is set for container image.

:::note 
Rule Uses Scribe API to check for CVEs in the target artifact, Ensure usage of Scribe Token in the environment.  
::: 
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
uses: api/scribe-api-published@v2/rules
with:
  superset:
    published: true
```

## Mitigation  
Ensure that all critical or high severity vulnerabilities are addressed before delivering the product.


## Description  
This rule ensures that the product is published only after all critical or high severity vulnerabilities are addressed.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| superset | object | False | The superset of CVEs to check for, including the following format [published: [flag: bool]] |

