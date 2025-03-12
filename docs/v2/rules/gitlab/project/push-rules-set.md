---
sidebar_label: Set Push Rules for GitLab Project
title: Set Push Rules for GitLab Project
---  
# Set Push Rules for GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-push_rules`  
**Uses:** `gitlab/project/push-rules-set@v2/rules`  
**Source:** [v2/rules/gitlab/project/push-rules-set.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-rules-set.yaml)  
**Rego Source:** [push-rules-set.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-rules-set.rego)  
**Labels:** Gitlab, Project  

Verify push rules are set for the GitLab project.

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

