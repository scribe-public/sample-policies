# Rule: Restrict Coding Permissions

**ID**: `git-coding-permissions`  
**Source**: [v2/rules/git/coding-permissions.yaml](scribe-public/sample-policies.git/v2/rules/git/coding-permissions.yaml)  
**Rego File Path**: `coding-permissions.rego`  

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
