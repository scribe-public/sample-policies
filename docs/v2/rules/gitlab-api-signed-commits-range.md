# Rule: Sign Selected Commit Range in GitLab

**ID**: `gitlab-api-signed-commits-range`  
**Source YAML**: `signed-commits-range.yaml`  
**Rego File Path**: `signed-commits-range.rego`  

**Labels**: Gitlab, API

**Short Description**: Verify the selected range of commits is signed via the GitLab API.

## Rule Parameters (`with`)

```yaml
since: ''
until: ''
project_id: ''
private_token: ''
```
