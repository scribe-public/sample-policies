---
sidebar_label: Allowed Admins in GitLab Organization
title: Allowed Admins in GitLab Organization
---  
# Allowed Admins in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-admins`  
**Uses:** `gitlab/org/allow-admins@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-admins.rego)  
**Labels:** Gitlab, Organization  

Verify only users in the Allowed List have admin privileges in the GitLab organization.

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
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_admins | [] |
