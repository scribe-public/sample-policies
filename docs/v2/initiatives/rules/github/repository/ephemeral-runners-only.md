---
sidebar_label: Verify Only Ephemeral Runners Exist in Repository
title: Verify Only Ephemeral Runners Exist in Repository
---  
# Verify Only Ephemeral Runners Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-ephemeral-runners-only`  
**Source:** [v2/rules/github/repository/ephemeral-runners-only.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/ephemeral-runners-only.yaml)  
**Rego Source:** [ephemeral-runners-only.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/ephemeral-runners-only.rego)  
**Labels:** GitHub, Repository  

Verify self-hosted runners are disallowed in the GitHub repository.

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
uses: github/repository/ephemeral-runners-only@v2

## Usage example

```yaml
with: github/repository/ephemeral-runners-only@v2
```

## Mitigation  
Ensures that only ephemeral runners are used, reducing the risk of persistent runner vulnerabilities.



## Description  
This rule ensures that only ephemeral runners are used in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for runner configuration.
2. Verifies that only ephemeral runners are used.

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

