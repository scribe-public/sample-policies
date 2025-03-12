---
sidebar_label: Set Push Access Level in GitLab Project
title: Set Push Access Level in GitLab Project
---  
# Set Push Access Level in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-push-access-level`  
**Uses:** `gitlab/project/push-access-level@v2/rules`  
**Source:** [v2/rules/gitlab/project/push-access-level.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-access-level.yaml)  
**Rego Source:** [push-access-level.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-access-level.rego)  
**Labels:** Gitlab, Project  

Verify the GitLab project's push access level policy complies with requirements.

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
| branch | main |
| access_level_description | Maintainers |
