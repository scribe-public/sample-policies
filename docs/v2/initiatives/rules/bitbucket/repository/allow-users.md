---
sidebar_label: Allowed Repository Users
title: Allowed Repository Users
---  
# Allowed Repository Users  
**Type:** Rule  
**ID:** `bb-repo-allowed-repository-users`  
**Uses:** `bitbucket/repository/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/repository/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.rego)  
**Labels:** Bitbucket, Repository  

Verify only users specified in the Allowed List have user access to the Bitbucket repository.

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
| labels | - platform=bitbucket<br/>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_users | [] |
