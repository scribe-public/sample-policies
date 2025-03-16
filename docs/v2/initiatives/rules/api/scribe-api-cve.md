---
sidebar_label: Verify No Critical or High Vulnerabilities
title: Verify No Critical or High Vulnerabilities
---  
# Verify No Critical or High Vulnerabilities  
**Type:** Rule  
**ID:** `scribe-cve`  
**Source:** [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source:** [scribe-api.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api.rego)  
**Labels:** SCA, Blueprint, Scribe  

Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

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
:::info  
Rule is scoped by product and target.  
:::  

## Usage example

```yaml
uses: api/scribe-api-cve@v2
with:
  superset:
    cve:
      max: 0
      severity: 6
```

## Mitigation  
Ensure that all critical or high severity vulnerabilities are addressed before delivering the product.


## Description  
This rule ensures that there are no critical or high severity vulnerabilities in any deliverable component of the product by verifying via the Scribe API.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| superset | object | False | The superset of CVEs to check for, including the following format [cve: [max: int, severity: int]] |

