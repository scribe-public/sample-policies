# Rule: Sign Selected Commit Range in GitLab

**ID**: `gitlab-api-signed-commits-range`
**Source**: [v2/rules/gitlab/api/signed-commits-range.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-range.yaml)
**Uses**: `gitlab/api/signed-commits-range@v2/rules
**Rego Source**: [signed-commits-range.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/signed-commits-range.rego)

**Labels**: Gitlab, API

**Short Description**: Verify the selected range of commits is signed via the GitLab API.

## Rule Parameters (`with`)

```yaml
since: ''
until: ''
project_id: ''
private_token: ''
```
