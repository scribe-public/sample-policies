# Rule: Verify Selected Commits Are Signed API

**ID**: `github-api-signed-commits-list`  
**Source YAML**: `signed-commits-list.yaml`  
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
