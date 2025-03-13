---
sidebar_label: Enforce Medium Severity Limit
title: Enforce Medium Severity Limit
---  
# Enforce Medium Severity Limit  
**Type:** Rule  
**ID:** `gitlab-project-medium-severity-limit`  
**Uses:** `gitlab/project/medium-severity-limit@v2/rules`  
**Source:** [v2/rules/gitlab/project/medium-severity-limit.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/medium-severity-limit.yaml)  
**Rego Source:** [medium-severity-limit.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/medium-severity-limit.rego)  
**Labels:** Gitlab, Project  

Verify the maximum allowed medium severity alerts for the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence.  
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
| max_allowed_specific_severity | 0 |

