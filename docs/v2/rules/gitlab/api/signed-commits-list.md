# Sign Selected Commits in GitLab  
** Type:** Rule  
**ID:** `gitlab-api-signed-commits-list`  
**Uses:** `gitlab/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.rego)  
**Labels:** Gitlab, API  

Verify the selected commits are signed in the GitLab organization.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Rule Parameters (`with`)  
```yaml
commit_id_list: []
private_token: ''
project_id: ''
```

