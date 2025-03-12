---
sidebar_label: Limit Admins in GitLab Organization
title: Limit Admins in GitLab Organization
---  
# Limit Admins in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-max-admins`  
**Uses:** `gitlab/org/max-admins@v2/rules`  
**Source:** [v2/rules/gitlab/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/max-admins.rego)  
**Labels:** Blueprint, GitLab, Organization  

Verify the maximum number of admins for the GitLab project is restricted.

:::note 
This rule requires Gitlab Organization Discovery Evidence.  
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
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_admins | 0 |
