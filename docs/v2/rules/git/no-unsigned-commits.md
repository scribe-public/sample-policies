# Rule: Disallow Unsigned Commits

**ID**: `git-disallow-unsigned-commits`
**Source**: [v2/rules/git/no-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.yaml)
**Uses**: `git/no-unsigned-commits@v2/rules
**Rego Source**: [no-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.rego)

**Labels**: Git

**Short Description**: Verify all commits are signed.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: git
```
