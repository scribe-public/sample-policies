---
sidebar_label: Allowed Public Repositories
title: Allowed Public Repositories
---  
# Allowed Public Repositories  
**Type:** Rule  
**ID:** `github-repo-visibility`  
**Source:** [v2/rules/github/repository/visibility.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/visibility.yaml)  
**Rego Source:** [visibility.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/visibility.rego)  
**Labels:** GitHub, Repository  

Verify only GitHub repositories in the Allowed List are public.

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
uses: github/repository/visibility@v2
with:
  allowed_repo_names:
  - my-org/.*
  - my-org/my-repo.*
```

## Mitigation  
Ensures that only allowed repositories are public, reducing the risk of unauthorized access.


## Description  
This rule ensures that only GitHub repositories in the Allowed List are public.
It performs the following steps:

1. Checks the repository settings for visibility.
2. Verifies that the repository is public only if it is in the Allowed List.

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

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_repo_names | string | False | List of allowed repository patterns. |

