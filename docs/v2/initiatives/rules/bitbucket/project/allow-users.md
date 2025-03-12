---
sidebar_label: Allowed Project Users
title: Allowed Project Users
---  
# Allowed Project Users  
**Type:** Rule  
**ID:** `bb-project-allowed-project-users`  
**Uses:** `bitbucket/project/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/project/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-users.rego)  

Verify only users specified in the Allowed List have user access to the Bitbucket project.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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
| allowed_users | [] |
