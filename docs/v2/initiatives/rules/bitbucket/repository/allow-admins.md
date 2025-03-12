---
sidebar_label: Allowed Repository Admins
title: Allowed Repository Admins
---  
# Allowed Repository Admins  
**Type:** Rule  
**ID:** `bb-repo-allowed-repository-admins`  
**Uses:** `bitbucket/repository/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/repository/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.rego)  
**Labels:** Bitbucket, Repository  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository.

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
| labels | - platform=bitbucket<br/>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_admins | [] |
