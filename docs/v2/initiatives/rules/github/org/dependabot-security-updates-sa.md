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
uses: github/org/dependabot-security-updates-sa@v2/rules
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

