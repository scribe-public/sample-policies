# Rule: Disallow Commits to Main Branch

**ID**: `git-disallow-commits-to-main`
**Source**: [v2/rules/git/no-commit-to-main.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/no-commit-to-main.yaml)
**Uses**: `git/no-commit-to-main@v2/rules
**Rego File Path**: `no-commit-to-main.rego`

**Labels**: Git

**Short Description**: Verify commits made directly to the main branch are disallowed.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: git
```
