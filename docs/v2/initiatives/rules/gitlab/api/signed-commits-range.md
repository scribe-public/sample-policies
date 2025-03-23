---
sidebar_label: Sign Selected Commit Range in GitLab
title: Sign Selected Commit Range in GitLab
---  
# Sign Selected Commit Range in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-signed-commits-range`  
**Source:** [v2/rules/gitlab/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-range.rego)  
**Labels:** Gitlab, API  

Verify the selected range of commits is signed via the GitLab API.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/api/signed-commits-range@v2
with:
  since: "2021-01-01T00:00:00Z"
  until: "2021-01-31T23:59:59Z"
  project_id: my_project_id
  private_token: '{{ .Args.Token }}'
```

## Mitigation  
Ensure that the commits in the specified time range are signed in the GitLab repository.


## Description  
This rule ensures that the commits in the specified time range are signed in the GitLab repository.
It performs the following steps:

1. Checks the commits in the specified time range in the GitLab repository.
2. Verifies that the commits in the specified time range are signed.
2.1 Verifies that the commits in the specified time range are signed by the proper owner.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab repository resources.
- GitLab API token must be provided to access the GitLab API.

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| since | string | False | ISO 8601 date-time string. The beginning of the time range. |
| until | string | False | ISO 8601 date-time string. The end of the time range. |
| project_id | string | True | GitLab project ID. |
| private_token | string | True | GitLab API access token. |

