# Rule: Verify Selected Commits Are Signed API

**ID**: `github-api-signed-commits-list`  
**Source**: [v2/rules/github/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/signed-commits-list.yaml)  
**Rego File Path**: `signed-commits-list.rego`  

**Labels**: GitHub, API

**Short Description**: Verify selected commits are signed in the GitHub organization.

## Rule Parameters (`with`)

```yaml
commit_id_list: []
access_token: ''
owner: ''
repo: ''
```
