---
sidebar_label: Disallow Banned Approvers
title: Disallow Banned Approvers
---  
# Disallow Banned Approvers  
**Type:** Rule  
**ID:** `gitlab-project-disallowed-banned-approvers`  
**Uses:** `gitlab/project/disallowed-banned-approvers@v2/rules`  
**Source:** [v2/rules/gitlab/project/disallowed-banned-approvers.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/disallowed-banned-approvers.yaml)  
**Rego Source:** [disallowed-banned-approvers.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/disallowed-banned-approvers.rego)  
**Labels:** Gitlab, Project  

Verify approvers in the GitLab project are not on the banned list.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
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
| banned_list | [] |

