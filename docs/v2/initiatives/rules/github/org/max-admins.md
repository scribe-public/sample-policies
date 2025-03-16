---
sidebar_label: Verify Maximum Number of Admins
title: Verify Maximum Number of Admins
---  
# Verify Maximum Number of Admins  
**Type:** Rule  
**ID:** `github-org-max-admins`  
**Source:** [v2/rules/github/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/max-admins.rego)  
**Labels:** GitHub, Organization  

Verify that the number of admins in the GitHub organization does not exceed the specified maximum.

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
uses: github/org/max-admins@v2
with:
  max_admins: 5
  
```

## Mitigation  
Ensures that the number of admins in the GitHub organization is kept within a manageable limit, reducing the risk of unauthorized administrative actions.



## Description  
This rule ensures that the number of admins in the GitHub organization does not exceed the specified maximum.
It performs the following steps:

1. Checks the list of admins in the GitHub organization.
2. Verifies that the number of admins does not exceed the value specified in the `with.max_admins` configuration.

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
| max_admins | integer | False | Maximum number of admins allowed. |

