# Rule: Sign Selected Commits in GitLab

**ID**: `gitlab-api-signed-commits-list`  
**Source**: [v2/rules/gitlab/api/signed-commits-list.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-list.yaml)  
**Rego File Path**: `signed-commits-list.rego`  

**Labels**: Gitlab, API

**Short Description**: Verify the selected commits are signed in the GitLab organization.

## Rule Parameters (`with`)

```yaml
commit_id_list: []
private_token: ''
project_id: ''
```
