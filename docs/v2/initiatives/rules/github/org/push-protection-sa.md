---
sidebar_label: Verify Secret Scanning Push Protection Enabled in Security and Analysis
title: Verify Secret Scanning Push Protection Enabled in Security and Analysis
---  
# Verify Secret Scanning Push Protection Enabled in Security and Analysis  
**Type:** Rule  
**ID:** `github-org-push-protection-sa`  
**Source:** [v2/rules/github/org/push-protection-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection-sa.yaml)  
**Rego Source:** [push-protection-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection` is enabled in the security and analysis settings of the GitHub organization.

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
uses: github/org/push-protection-sa@v2

## Usage example

```yaml
with: github/org/push-protection-sa@v2
```

## Mitigation  
Ensure that secret scanning push protection is enabled to provide better security for secret scanning in the GitHub organization.



## Description  
This rule ensures that secret scanning push protection is enabled in the security and analysis settings of the GitHub organization.
It performs the following steps:

1. Checks the security and analysis settings of the GitHub organization.
2. Verifies that the secret scanning push protection setting is enabled.

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

