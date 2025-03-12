---
sidebar_label: Allowed Workspace Users
title: Allowed Workspace Users
---  
# Allowed Workspace Users  
**Type:** Rule  
**ID:** `bb-workspace-allowed-workspace-users`  
**Uses:** `bitbucket/workspace/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/workspace/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/workspace/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/workspace/allow-users.rego)  
**Labels:** Bitbucket, Workspace  

Verify only users specified in the Allowed List have user access to the Bitbucket workspace.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
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
