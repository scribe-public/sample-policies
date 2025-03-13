---
sidebar_label: Verify No Critical or High Vulnerabilities
title: Verify No Critical or High Vulnerabilities
---  
# Verify No Critical or High Vulnerabilities  
**Type:** Rule  
**ID:** `scribe-cve`  
**Uses:** `api/scribe-api-cve@v2/rules`  
**Source:** [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source:** [scribe-api.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api.rego)  
**Labels:** SCA, Blueprint, Scribe  

Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

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

## Mitigation  
Regularly scan the target artifact for vulnerabilities to ensure that it remains secure.


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
| superset | object | False | The superset of CVEs to check for, including the following format {cve: {max: <int>, severity: <int}} |

