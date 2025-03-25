---
sidebar_label: Verify Selected Commits Are Signed API
title: Verify Selected Commits Are Signed API
---  
# Verify Selected Commits Are Signed API  
**Type:** Rule  
**ID:** `github-api-signed-commits-list`  
**Source:** [v2/rules/github/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-list.rego)  
**Labels:** GitHub, API  

Verify selected commits are signed in the GitHub organization.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/api/signed-commits-list@v2
with:
  commit_id_list:
    - "11111115644ea629569e6a3c98c8375111111"
    - "22222225644ea629569e6a3c98c8375222222"
  access_token: '{{ .Args.Token }}'
  owner: my_owner
```

## Description  
This rule ensures that the selected commits are signed in the GitHub organization.
It performs the following steps:

1. Checks the selected commits in the Selected GitHub repository.
2. Verifies that the selected commits are signed.
2.1 Verifies that the selected commits are signed by the proper owner.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository resources.
- Github API token must be provided to access the GitHub API.

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| commit_id_list | array | True | List of commit IDs to verify if they are signed. |
| access_token | string | True | GitHub API access token. |
| owner | string | True | GitHub repository owner. |
| repo | string | True | GitHub repository name. |

