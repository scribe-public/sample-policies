# Rule: Disallow Unsigned Commits In Time Range  
**ID:** `signed-commits-range`  
**Uses:** `github/api/signed-commits-range@v2/rules`  
**Source:** [v2/rules/github/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.rego)  
**Short Description:** Verify commits in the specified time range are signed.  
**Labels:** GitHub  

## Rule Parameters (`with`)  
```yaml
access_token: ''
owner: ''
repo: ''
since: null
until: null
sha: null
```

