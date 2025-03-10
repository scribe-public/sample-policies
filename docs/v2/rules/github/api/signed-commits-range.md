# Rule: Disallow Unsigned Commits In Time Range

**ID**: `signed-commits-range`  
**Source**: [v2/rules/github/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-range.yaml)  
**Rego File Path**: `signed-commits-range.rego`  

**Labels**: GitHub

**Short Description**: Verify commits in the specified time range are signed.

## Rule Parameters (`with`)

```yaml
access_token: ''
owner: ''
repo: ''
since: null
until: null
sha: null
```
