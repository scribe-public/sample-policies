# Disallow Unsigned Commits In Time Range  
** Type:** Rule  
**ID:** `signed-commits-range`  
**Uses:** `github/api/signed-commits-range@v2/rules`  
**Source:** [v2/rules/github/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.yaml)  
**Rego Source:** [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.rego)  
**Labels:** GitHub  

Verify commits in the specified time range are signed.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Rule Parameters (`with`)  
```yaml
access_token: ''
owner: ''
repo: ''
since: null
until: null
sha: null
```

