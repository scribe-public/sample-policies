---
sidebar_label: Verify Secret_Scanning_Validity_Checks_Enabled Setting
title: Verify Secret_Scanning_Validity_Checks_Enabled Setting
---  
# Verify Secret_Scanning_Validity_Checks_Enabled Setting  
**Type:** Rule  
**ID:** `github-org-validity-checks`  
**Source:** [v2/rules/github/org/validity-checks.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks.rego)  
**Labels:** GitHub, Organization  

Ensure Validity Checks are configured and enabled in the GitHub repository.

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
uses: github/org/validity-checks@v2
```

## Mitigation  
Ensure that the Validity Checks under Github Repository setting is enabled to validate the integrity of the repository, preventing potential issues and vulnerabilities.



## Description  
This rule ensures that  are enabled to validate the integrity of the repository.
It performs the following steps:

1. Checks the validity checks settings of the GitHub repository.
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | False |

