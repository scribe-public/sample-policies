---
sidebar_label: Verify Repository Is Private
title: Verify Repository Is Private
---  
# Verify Repository Is Private  
**Type:** Rule  
**ID:** `github-repo-private`  
**Source:** [v2/rules/github/repository/repo-private.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/repo-private.yaml)  
**Rego Source:** [repo-private.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/repo-private.rego)  
**Labels:** GitHub, Repository  

Verify the GitHub repository is private.

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
uses: github/repository/repo-private@v2
```

## Mitigation  
Ensures that the repository is private, reducing the risk of unauthorized access.


## Description  
This rule ensures that the GitHub repository is private.
It performs the following steps:

1. Checks the repository settings for privacy.
2. Verifies that the repository is private.

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

