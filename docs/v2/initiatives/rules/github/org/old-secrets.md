---
sidebar_label: Verify GitHub Organization Secrets Are Not Too Old
title: Verify GitHub Organization Secrets Are Not Too Old
---  
# Verify GitHub Organization Secrets Are Not Too Old  
**Type:** Rule  
**ID:** `github-org-old-secrets`  
**Source:** [v2/rules/github/org/old-secrets.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/old-secrets.rego)  
**Labels:** GitHub, Organization  

Verify secrets in the GitHub organization are not older than the specified threshold.

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
uses: github/org/old-secrets@v2
with:
  max_secret_age: 12
```

## Mitigation  
Ensures that old secrets are removed from the GitHub organization, reducing the risk of exposure of outdated and potentially compromised secrets.


## Description  
This rule ensures that secrets in the GitHub organization are not older than the specified threshold.
It performs the following steps:

1. Checks the list of secrets in the GitHub organization.
2. Verifies that no secrets are older than the value specified in the `with.max_secret_age` configuration.

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
| max_secret_age | integer | False | Maximum age of secrets in months. |

