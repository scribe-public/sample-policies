---
sidebar_label: Verify dependabot_security_updates setting in security_and_analysis
title: Verify dependabot_security_updates setting in security_and_analysis
---  
# Verify dependabot_security_updates setting in security_and_analysis  
**Type:** Rule  
**ID:** `github-org-dependabot-security-updates-sa`  
**Source:** [v2/rules/github/org/dependabot-security-updates-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-security-updates-sa.yaml)  
**Rego Source:** [dependabot-security-updates-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-security-updates-sa.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot security updates are configured in the GitHub organization.

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
uses: github/org/dependabot-security-updates-sa@v2
```

## Mitigation  
Ensures that Dependabot security updates are enabled in the GitHub organization, reducing the risk of vulnerabilities in dependencies.


## Description  
This rule ensures that Dependabot security updates are enabled in the GitHub organization.
It performs the following steps:

1. Checks the security and analysis settings of the GitHub organization.
2. Verifies that the Dependabot security updates setting is enabled.

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

