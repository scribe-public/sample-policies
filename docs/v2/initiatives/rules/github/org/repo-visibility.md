---
sidebar_label: Verify Repository Visibility Setting
title: Verify Repository Visibility Setting
---  
# Verify Repository Visibility Setting  
**Type:** Rule  
**ID:** `github-org-repo-visibility`  
**Source:** [v2/rules/github/org/repo-visibility.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/repo-visibility.yaml)  
**Rego Source:** [repo-visibility.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/repo-visibility.rego)  
**Labels:** GitHub, Organization  

Verify that the repository visibility setting is configured correctly in the GitHub organization.

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
uses: github/org/repo-visibility@v2
with:
  allowed_repo_names:
    - "my_org/.*"
    - "my_org/my_repo/.*"
```

## Mitigation  
Ensure that the repository visibility setting is configured correctly to reduce the risk of unauthorized access to repositories.



## Description  
This rule ensures that the repository visibility setting is configured correctly in the GitHub organization.
It performs the following steps:

1. Checks the visibility settings of repositories in the GitHub organization.
2. Verifies that the visibility setting matches the value specified in the `with.desired_visibility` configuration.

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
| allowed_repo_names | array | False | List of repository pattern allowed to be visible. |

