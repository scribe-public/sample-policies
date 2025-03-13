---
sidebar_label: Verify Selected Commits Are Signed API
title: Verify Selected Commits Are Signed API
---  
# Verify Selected Commits Are Signed API  
**Type:** Rule  
**ID:** `github-api-signed-commits-list`  
**Uses:** `github/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/github/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/signed-commits-list.rego)  
**Labels:** GitHub, API  

Verify selected commits are signed in the GitHub organization.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| commit_id_list | [] |
| access_token |  |
| owner |  |
| repo |  |

