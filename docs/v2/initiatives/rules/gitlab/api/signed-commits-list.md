---
sidebar_label: Sign Selected Commits in GitLab
title: Sign Selected Commits in GitLab
---  
# Sign Selected Commits in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-signed-commits-list`  
**Uses:** `gitlab/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-list.rego)  
**Labels:** Gitlab, API  

Verify the selected commits are signed in the GitLab organization.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| commit_id_list | [] |
| private_token |  |
| project_id |  |
