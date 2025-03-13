---
sidebar_label: Allowed Project Admins
title: Allowed Project Admins
---  
# Allowed Project Admins  
**Type:** Rule  
**ID:** `bb-project-allowed-project-admins`  
**Uses:** `bitbucket/project/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/project/allow-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-admins.rego)  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket project.

:::note 
This rule requires Bitbucket Project Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details.  
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
| labels | - platform=bitbucket<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_admins | [] |

