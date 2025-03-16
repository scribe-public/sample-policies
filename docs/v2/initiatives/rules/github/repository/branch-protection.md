---
sidebar_label: Verify Branch Protection Setting
title: Verify Branch Protection Setting
---  
# Verify Branch Protection Setting  
**Type:** Rule  
**ID:** `github-repo-branch-protection`  
**Source:** [v2/rules/github/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/branch-protection.rego)  
**Labels:** GitHub, Repository  

Verify branch protection is configured in the GitHub repository.

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
uses: github/repository/branch-protection@v2
with:
  desired_protected: true
  branches:
    - 'main'
    - 'master'
  
```

## Mitigation  
Ensures that branch protection settings are correctly configured, reducing the risk of unauthorized changes.



## Description  
This rule ensures that branch protection is configured in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for branch protection.
2. Verifies that the protection settings match the expected values.

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
| desired_protected | boolean | False | Desired branch protection setting. |
| branches | array | False | List of branches to be protected. |

