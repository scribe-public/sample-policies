---
sidebar_label: Verify Attack Vector Threshold in Trivy SARIF
title: Verify Attack Vector Threshold in Trivy SARIF
---  
# Verify Attack Vector Threshold in Trivy SARIF  
**Type:** Rule  
**ID:** `trivy-attack-vectors`  
**Uses:** `sarif/trivy/verify-trivy-attack-vector@v2/rules`  
**Source:** [v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml)  
**Rego Source:** [../verify-attack-vector.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/trivy/../verify-attack-vector.rego)  
**Labels:** SARIF, Trivy  

Verify no attack vector in the Trivy SARIF report exceeds the specified threshold.

:::note 
This rule requires SARIF Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sarif) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::info  
Rule is scoped by product.  
:::  

## Usage example

```yaml
uses: sarif/trivy/verify-trivy-attack-vector@v2/rules
with:
  attack_vectors:
    - "stack buffer overflow"
  violations_threshold: 2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |
| tool | Trivy Vulnerability Scanner |
| filter-by | ['product'] |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| attack_vectors | array | False | List of attack vectors to check for in the Trivy SARIF report. |
| violations_threshold | integer | False | The maximum number of allowed attack vector violations in the Trivy SARIF report. |

