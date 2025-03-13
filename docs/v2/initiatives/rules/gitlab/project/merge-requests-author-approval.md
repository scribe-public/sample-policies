---
sidebar_label: Disable Author Approval for Merge Requests in GitLab
title: Disable Author Approval for Merge Requests in GitLab
---  
# Disable Author Approval for Merge Requests in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-merge-requests-author-approval`  
**Uses:** `gitlab/project/merge-requests-author-approval@v2/rules`  
**Source:** [v2/rules/gitlab/project/merge-requests-author-approval.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/merge-requests-author-approval.yaml)  
**Rego Source:** [merge-requests-author-approval.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/merge-requests-author-approval.rego)  
**Labels:** Gitlab, Project  

Verify the binary field `merge_requests_author_approval` is set for the GitLab project.

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
| merge_requests_author_approval | True |

