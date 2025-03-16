---
sidebar_label: Verify Validity checks are configured and enabled in the GitHub organization.
title: Verify Validity checks are configured and enabled in the GitHub organization.
---  
# Verify Validity checks are configured and enabled in the GitHub organization.  
**Type:** Rule  
**ID:** `github-org-validity-checks-sa`  
**Source:** [v2/rules/github/org/validity-checks-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks-sa.yaml)  
**Rego Source:** [validity-checks-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks-sa.rego)  
**Labels:** GitHub, Organization  

Verify Validity checks are configured and enabled in the GitHub organization.

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
uses: github/org/validity-checks-sa@v2

## Usage example

```yaml
with: github/org/validity-checks-sa@v2
```

## Mitigation  
Ensure that the Validity checks under GitHub organization setting is enabled to maintain the integrity of the organization’s repositories, preventing potential issues and vulnerabilities.



## Description  
This rule checks if the `validity_checks` under GitHub organization setting is enabled to ensure the integrity of the organization’s repositories.
It performs the following steps:

1. Checks the validity checks settings of the GitHub organization.
2. Verifies that the validity checks setting is enabled.

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

