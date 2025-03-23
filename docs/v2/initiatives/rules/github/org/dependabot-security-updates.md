---
sidebar_label: Verify dependabot_security_updates_enabled_for_new_repositories setting
title: Verify dependabot_security_updates_enabled_for_new_repositories setting
---  
# Verify dependabot_security_updates_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependabot-security-updates`  
**Source:** [v2/rules/github/org/dependabot-security-updates.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-security-updates.yaml)  
**Rego Source:** [dependabot-security-updates.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-security-updates.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot security updates for new repositories are configured in the GitHub organization.

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
uses: github/org/dependabot-security-updates@v2
with:
  desired_value: true
```

## Mitigation  
Ensures that Dependabot security updates are enabled for new repositories in the GitHub organization, reducing the risk of vulnerabilities in dependencies.


## Description  
This rule ensures that Dependabot security updates are enabled for new repositories in the GitHub organization.
It performs the following steps:

1. Checks the security and analysis settings of the GitHub organization.
2. Verifies that the Dependabot security updates setting is enabled for new repositories.

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
| desired_value | boolean | False | Indicates if Dependabot security updates for new repositories are enabled. |

