---
sidebar_label: Verify dependabot_alerts_enabled_for_new_repositories setting
title: Verify dependabot_alerts_enabled_for_new_repositories setting
---  
# Verify dependabot_alerts_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependabot-alerts`  
**Source:** [v2/rules/github/org/dependabot-alerts.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-alerts.yaml)  
**Rego Source:** [dependabot-alerts.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-alerts.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot alerts for new repositories are enabled in the GitHub organization.

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
uses: github/org/dependabot-alerts@v2
with:
  desired_value: true
  
```

## Mitigation  
Ensures that Dependabot alerts are enabled for new repositories in the GitHub organization, helping to identify and address vulnerabilities in dependencies.



## Description  
This rule verifies that Dependabot alerts for new repositories are enabled in the GitHub organization.
It performs the following steps:

1. Checks the organization's settings for the `dependabot_alerts_enabled_for_new_repositories` field.
2. Compares the value of this field against the desired value specified in the `with.desired_value` configuration.
   - If the field does not match the desired value, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization settings.


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
| desired_value | boolean | False | Desired value for the dependabot_alerts_enabled_for_new_repositories setting. |

