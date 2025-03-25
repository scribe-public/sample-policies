---
sidebar_label: Verify `secret_scanning_push_protection_enabled_for_new_repositories`
  Setting
title: Verify `secret_scanning_push_protection_enabled_for_new_repositories` Setting
---  
# Verify `secret_scanning_push_protection_enabled_for_new_repositories` Setting  
**Type:** Rule  
**ID:** `github-org-push-protection`  
**Source:** [v2/rules/github/org/push-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection.yaml)  
**Rego Source:** [push-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization.

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
uses: github/org/push-protection@v2
with:
  desired_value: true
```

## Mitigation  
Ensures that secret scanning push protection is enabled for new repositories in the GitHub organization, providing better security for secret scanning.


## Description  
This rule ensures that secret scanning push protection is enabled for new repositories in the GitHub organization.
It performs the following steps:

1. Checks the security and analysis settings of the GitHub organization.
2. Verifies that the secret scanning push protection setting is enabled for new repositories.

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
| desired_value | boolean | False | Indicates if the secret scanning push protection is enabled for new repositories. |

