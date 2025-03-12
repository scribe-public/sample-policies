---
sidebar_label: Verify members_can_create_repositories setting
title: Verify members_can_create_repositories setting
---  
# Verify members_can_create_repositories setting  
**Type:** Rule  
**ID:** `github-org-create-repos`  
**Uses:** `github/org/create-repos@v2/rules`  
**Source:** [v2/rules/github/org/create-repos.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-repos.yaml)  
**Rego Source:** [create-repos.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/create-repos.rego)  
**Labels:** GitHub, Organization  

Verify `members_can_create_repositories` is appropriately configured in the GitHub repository.

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
| labels | - platform=github<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | False |
