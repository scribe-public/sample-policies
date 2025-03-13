---
sidebar_label: Verify dependabot_alerts_enabled_for_new_repositories setting
title: Verify dependabot_alerts_enabled_for_new_repositories setting
---  
# Verify dependabot_alerts_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependabot-alerts`  
**Uses:** `github/org/dependabot-alerts@v2/rules`  
**Source:** [v2/rules/github/org/dependabot-alerts.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-alerts.yaml)  
**Rego Source:** [dependabot-alerts.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependabot-alerts.rego)  
**Labels:** GitHub, Organization  

Verify Dependabot alerts for new repositories are enabled in the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

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

