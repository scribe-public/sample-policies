---
sidebar_label: Check Description Substring
title: Check Description Substring
---  
# Check Description Substring  
**Type:** Rule  
**ID:** `gitlab-project-description-substring-check`  
**Uses:** `gitlab/project/description-substring-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/description-substring-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/description-substring-check.yaml)  
**Rego Source:** [description-substring-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/description-substring-check.rego)  
**Labels:** Gitlab, Project  

Verify a specific substring is not found in the description attribute of vulnerabilities for the GitLab project.

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
| pattern | (?i)insdput |
