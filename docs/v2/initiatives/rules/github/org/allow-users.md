---
sidebar_label: Allowed GitHub Organization Users
title: Allowed GitHub Organization Users
---  
# Allowed GitHub Organization Users  
**Type:** Rule  
**ID:** `github-org-allowed-users`  
**Uses:** `github/org/allow-users@v2/rules`  
**Source:** [v2/rules/github/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-users.rego)  
**Labels:** GitHub, Organization  

Verify only users in the Allowed List have user access to the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
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
| allowed_users | [] |

