---
sidebar_label: Verify secret_scanning setting
title: Verify secret_scanning setting
---  
# Verify secret_scanning setting  
**Type:** Rule  
**ID:** `github-repo-secret-scanning`  
**Source:** [v2/rules/github/repository/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/secret-scanning.yaml)  
**Rego Source:** [secret-scanning.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/secret-scanning.rego)  
**Labels:** GitHub, Repository  

Verify Secret Scanning Setting is configured in the GitHub repository.

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
uses: github/repository/secret-scanning@v2

## Usage example

```yaml
with: github/repository/secret-scanning@v2
```

## Mitigation  
Ensures that Secret Scanning is configured, reducing the risk of leaking sensitive information.



## Description  
This rule ensures that the `secret_scanning` is configured in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for `secret_scanning` configuration.
2. Verifies that the configuration matches the expected settings.

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

