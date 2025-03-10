# Rule: Sign Selected Commit Range in GitLab  
**ID:** `gitlab-api-signed-commits-range`  
**Uses:** `gitlab/api/signed-commits-range@v2/rules`  
**Source:** [v2/rules/gitlab/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-range.rego)  
**Short Description:** Verify the selected range of commits is signed via the GitLab API.  
**Labels:** Gitlab, API  
> Evidence for this rule **IS NOT** required by default but is recommended


## Rule Parameters (`with`)  
```yaml
since: ''
until: ''
project_id: ''
private_token: ''
```

