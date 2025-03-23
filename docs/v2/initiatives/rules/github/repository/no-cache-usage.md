---
sidebar_label: Verify No Cache Usage Exists in Repository
title: Verify No Cache Usage Exists in Repository
---  
# Verify No Cache Usage Exists in Repository  
**Type:** Rule  
**ID:** `github-repo-no-cache-usage`  
**Source:** [v2/rules/github/repository/no-cache-usage.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/no-cache-usage.yaml)  
**Rego Source:** [no-cache-usage.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/no-cache-usage.rego)  
**Labels:** GitHub, Repository  

Verify the GitHub repository has no cache usage.

:::note 
This rule requires Github Repository Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/repository/no-cache-usage@v2
```

## Mitigation  
Ensures that no cache is used, reducing the risk of outdated or insecure dependencies.


## Description  
This rule ensures that no cache is used in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for cache usage.
2. Verifies that no cache is used.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository settings.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=repository |

