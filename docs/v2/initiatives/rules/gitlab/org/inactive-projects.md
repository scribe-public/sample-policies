---
sidebar_label: Ensure Active Projects in GitLab Organization
title: Ensure Active Projects in GitLab Organization
---  
# Ensure Active Projects in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-inactive-projects`  
**Uses:** `gitlab/org/inactive-projects@v2/rules`  
**Source:** [v2/rules/gitlab/org/inactive-projects.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/inactive-projects.yaml)  
**Rego Source:** [inactive-projects.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/inactive-projects.rego)  
**Labels:** Gitlab, Organization  

Verify no GitLab organization projects are inactive.

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
| inactive_for_days | 90 |
