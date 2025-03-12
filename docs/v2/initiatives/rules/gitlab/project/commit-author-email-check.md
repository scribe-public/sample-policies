---
sidebar_label: Restrict Commit Authors in GitLab Project
title: Restrict Commit Authors in GitLab Project
---  
# Restrict Commit Authors in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-commit-authors`  
**Uses:** `gitlab/project/commit-author-email-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-author-email-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-email-check.yaml)  
**Rego Source:** [commit-author-email-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only GitLab project users in the Allowed List have commit author permissions.

:::note 
This rule requires Unsigned Gitlab Project Discovery Evidence.  
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
| allowed_authors | ['mail@example.com'] |
