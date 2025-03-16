---
sidebar_label: Verify Default Branch Protection
title: Verify Default Branch Protection
---  
# Verify Default Branch Protection  
**Type:** Rule  
**ID:** `github-repo-default-branch-protection`  
**Source:** [v2/rules/github/repository/default-branch-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/default-branch-protection.yaml)  
**Rego Source:** [default-branch-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/default-branch-protection.rego)  
**Labels:** GitHub, Repository  

Verify the default branch protection is configured in the GitHub repository.

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
uses: github/repository/default-branch-protection@v2

## Usage example

```yaml
with: github/repository/default-branch-protection@v2
```

## Mitigation  
Ensures that the default branch is protected, reducing the risk of unauthorized changes.



## Description  
This rule ensures that the default branch protection is configured in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for default branch protection configuration.
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

