# Rule: Restrict Coding Permissions

**ID**: `git-coding-permissions`
**Source**: [v2/rules/git/coding-permissions.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.yaml)
**Uses**: `git/coding-permissions@v2/rules
**Rego Source**: [coding-permissions.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.rego)

**Labels**: Git

**Short Description**: Verify only allowed users committed to the repository.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: git
```
## Rule Parameters (`with`)

```yaml
ids: []
files: []
```
