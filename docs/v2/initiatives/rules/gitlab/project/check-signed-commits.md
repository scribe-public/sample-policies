---
sidebar_label: Ensure All Commits Are Signed in GitLab Project
title: Ensure All Commits Are Signed in GitLab Project
---  
# Ensure All Commits Are Signed in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-signed-commits`  
**Uses:** `gitlab/project/check-signed-commits@v2/rules`  
**Source:** [v2/rules/gitlab/project/check-signed-commits.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-signed-commits.yaml)  
**Rego Source:** [check-signed-commits.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-signed-commits.rego)  
**Labels:** Gitlab, Project  

Verify all commits in the GitLab project are signed.

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

