# Sign Selected Commits in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-signed-commits-list`  
**Uses:** `gitlab/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.rego)  
**Labels:** Gitlab, API  

Verify the selected commits are signed in the GitLab organization.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| commit_id_list | [] |
| private_token |  |
| project_id |  |
