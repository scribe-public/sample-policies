# Rule: Sign Selected Commits in GitLab  
**ID:** `gitlab-api-signed-commits-list`  
**Uses:** `gitlab/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.rego)  
**Short Description:** Verify the selected commits are signed in the GitLab organization.  
**Labels:** Gitlab, API  

## Rule Parameters (`with`)  
```yaml
commit_id_list: []
private_token: ''
project_id: ''
```

