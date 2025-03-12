---
sidebar_label: Sign Selected Commit Range in GitLab
title: Sign Selected Commit Range in GitLab
---  
# Sign Selected Commit Range in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-signed-commits-range`  
**Uses:** `gitlab/api/signed-commits-range@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/signed-commits-range.rego)  
**Labels:** Gitlab, API  

Verify the selected range of commits is signed via the GitLab API.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| since |  |
| until |  |
| project_id |  |
| private_token |  |
