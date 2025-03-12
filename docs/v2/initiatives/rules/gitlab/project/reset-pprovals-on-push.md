---
sidebar_label: Reset Approvals on Push in GitLab Project
title: Reset Approvals on Push in GitLab Project
---  
# Reset Approvals on Push in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-reset-pprovals-on-push`  
**Uses:** `gitlab/project/reset-pprovals-on-push@v2/rules`  
**Source:** [v2/rules/gitlab/project/reset-pprovals-on-push.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reset-pprovals-on-push.yaml)  
**Rego Source:** [reset-pprovals-on-push.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reset-pprovals-on-push.rego)  
**Labels:** Gitlab, Project  

Verify `reset_approvals_on_push` is set for the GitLab project.

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
| reset_approvals_on_push | True |
