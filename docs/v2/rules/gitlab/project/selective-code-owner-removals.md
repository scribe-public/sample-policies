---
sidebar_label: Restrict Selective Code Owner Removals in GitLab
title: Restrict Selective Code Owner Removals in GitLab
---  
# Restrict Selective Code Owner Removals in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-selective-code-owner-removals`  
**Uses:** `gitlab/project/selective-code-owner-removals@v2/rules`  
**Source:** [v2/rules/gitlab/project/selective-code-owner-removals.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/selective-code-owner-removals.yaml)  
**Rego Source:** [selective-code-owner-removals.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/selective-code-owner-removals.rego)  
**Labels:** Gitlab, Project  

Verify `selective_code_owner_removals` is set for the GitLab project.

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
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| selective_code_owner_removals | True |
