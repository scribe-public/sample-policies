---
sidebar_label: Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories
  Setting
title: Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories Setting
---  
# Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories Setting  
**Type:** Rule  
**ID:** `github-org-push-protection`  
**Uses:** `github/org/push-protection@v2/rules`  
**Source:** [v2/rules/github/org/push-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection.yaml)  
**Rego Source:** [push-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/push-protection.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://scribe-security.netlify.app/platforms/discover#github-discovery) for more details.  
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
| desired_value | True |

