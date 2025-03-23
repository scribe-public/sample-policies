---
sidebar_label: Verify All Commits Are Signed in Repository
title: Verify All Commits Are Signed in Repository
---  
# Verify All Commits Are Signed in Repository  
**Type:** Rule  
**ID:** `github-repo-signed-commits`  
**Source:** [v2/rules/github/repository/check-signed-commits.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/check-signed-commits.yaml)  
**Rego Source:** [check-signed-commits.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/check-signed-commits.rego)  
**Labels:** GitHub, Repository  

Verify all commits in the GitHub repository are signed.

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
uses: github/repository/check-signed-commits@v2
```

## Mitigation  
Ensures that all commits are signed, reducing the risk of unauthorized changes.


## Description  
This rule ensures that all commits in the GitHub repository are signed.
It performs the following steps:

1. Iterates over the commits in the repository.
2. Checks each commit for a valid signature.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository commits.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=repository |

