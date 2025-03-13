---
sidebar_label: Require Code Owner Approval in GitLab Project
title: Require Code Owner Approval in GitLab Project
---  
# Require Code Owner Approval in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-code-owner-approval`  
**Uses:** `gitlab/project/co-approval-required@v2/rules`  
**Source:** [v2/rules/gitlab/project/co-approval-required.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/co-approval-required.yaml)  
**Rego Source:** [co-approval-required.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/co-approval-required.rego)  
**Labels:** Gitlab, Project  

Verify code owner approval is required for specific branches in the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://scribe-security.netlify.app/platforms/discover#gitlab-discovery) for more details.  
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

