---
sidebar_label: Disallow Unsigned Commits In Time Range
title: Disallow Unsigned Commits In Time Range
---  
# Disallow Unsigned Commits In Time Range  
**Type:** Rule  
**ID:** `signed-commits-range`  
**Source:** [v2/rules/github/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-range.rego)  
**Labels:** GitHub  

Verify commits in the specified time range are signed.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/api/signed-commits-range@v2
with:
  access_token: '{{
    .Args.Token
  }}'
  owner: my_owner
  repo: my_repo
  since: "2021-01-01T00:00:00Z"
  until: "2021-01-31T23:59:59Z"
  sha: "11111115644ea629569e6a3c98c8375111111"
```

## Description  
This rule ensures that the commits in the specified time range are signed in the GitHub repository.
It performs the following steps:

1. Checks the commits in the specified time range in the GitHub repository.
2. Verifies that the commits in the specified time range are signed.
2.1 Verifies that the commits in the specified time range are signed by the proper owner.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository resources.
- Github API token must be provided to access the GitHub API.

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| access_token | string | True | GitHub API access token. |
| owner | string | True | GitHub repository owner. |
| repo | string | True | GitHub repository name. |
| since | string | False | ISO 8601 date-time string. The beginning of the time range. |
| until | string | False | ISO 8601 date-time string. The end of the time range. |
| sha | string | False | The SHA of the commit to verify. |

