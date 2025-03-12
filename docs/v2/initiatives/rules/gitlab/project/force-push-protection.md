---
sidebar_label: Disallow Force Push in GitLab Project
title: Disallow Force Push in GitLab Project
---  
# Disallow Force Push in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-disallow-force-push`  
**Uses:** `gitlab/project/force-push-protection@v2/rules`  
**Source:** [v2/rules/gitlab/project/force-push-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/force-push-protection.yaml)  
**Rego Source:** [force-push-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/force-push-protection.rego)  
**Labels:** Gitlab, Project  

Verify force pushes in the GitLab project are disallowed to maintain repository integrity.

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
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| branch | main |
