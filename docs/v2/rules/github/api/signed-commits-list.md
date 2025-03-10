# Rule: Verify Selected Commits Are Signed API  
**ID:** `github-api-signed-commits-list`  
**Uses:** `github/api/signed-commits-list@v2/rules`  
**Source:** [v2/rules/github/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-list.yaml)  
**Rego Source:** [signed-commits-list.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-list.rego)  
**Short Description:** Verify selected commits are signed in the GitHub organization.  
**Labels:** GitHub, API  
> Evidence for this rule **IS NOT** required by default but is recommended


## Rule Parameters (`with`)  
```yaml
commit_id_list: []
access_token: ''
owner: ''
repo: ''
```

