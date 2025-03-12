---
sidebar_label: Enable Commit Committer Check in GitLab Project
title: Enable Commit Committer Check in GitLab Project
---  
# Enable Commit Committer Check in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-commit_committer_check`  
**Uses:** `gitlab/project/commit-committer-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-committer-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-committer-check.yaml)  
**Rego Source:** [commit-committer-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-committer-check.rego)  
**Labels:** Gitlab, Project  

Verify `commit_committer_check` is enabled for the GitLab project.

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

