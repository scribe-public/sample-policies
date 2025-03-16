---
sidebar_label: Verify Secret Scanning Push Protection Custom Link Enabled Setting
title: Verify Secret Scanning Push Protection Custom Link Enabled Setting
---  
# Verify Secret Scanning Push Protection Custom Link Enabled Setting  
**Type:** Rule  
**ID:** `github-org-pp-custom-link`  
**Source:** [v2/rules/github/org/pp-custom-link.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/pp-custom-link.yaml)  
**Rego Source:** [pp-custom-link.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/pp-custom-link.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/org/pp-custom-link@v2
with:
  desired_value: true
  
```

## Mitigation  
Ensure that the secret scanning push protection custom link is enabled to provide better security for secret scanning in the GitHub organization.



## Description  
This rule ensures that the secret scanning push protection custom link is enabled in the GitHub organization.
It performs the following steps:

1. Checks the settings of the GitHub organization.
2. Verifies that the secret scanning push protection custom link setting is enabled.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| desired_value | boolean | False | Indicates if the secret scanning push protection custom link is enabled. |

