---
sidebar_label: Verify secret scanning.
title: Verify secret scanning.
---  
# Verify secret scanning.  
**Type:** Rule  
**ID:** `github-repo-validity-checks`  
**Source:** [v2/rules/github/repository/validity-checks.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/validity-checks.rego)  
**Labels:** GitHub, Repository  

Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories.

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
uses: github/repository/validity-checks@v2
```

## Mitigation  
Ensure that the validity checks are set in the GitHub organization and all the repositories.


## Description  
This rule ensures that both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories.
It performs the following steps:

1. Checks the organization settings for `secret_scanning_validity_checks` and `security_and_analysis`.
2. Verifies that the settings are configured as expected.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=repository |

