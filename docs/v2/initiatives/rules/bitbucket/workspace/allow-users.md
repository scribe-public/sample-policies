---
sidebar_label: Allowed Workspace Users
title: Allowed Workspace Users
---  
# Allowed Workspace Users  
**Type:** Rule  
**ID:** `bb-workspace-allowed-workspace-users`  
**Uses:** `bitbucket/workspace/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/workspace/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-users.rego)  
**Labels:** Bitbucket, Workspace  

Verify only users specified in the Allowed List have user access to the Bitbucket workspace.

:::note 
This rule requires Bitbucket Workspace Discovery Evidence.  
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
| labels | - platform=bitbucket<br/>- asset_type=workspace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_users | [] |

