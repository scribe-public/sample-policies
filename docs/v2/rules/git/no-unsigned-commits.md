# Rule: Disallow Unsigned Commits

**ID**: `git-disallow-unsigned-commits`  
**Source**: [v2/rules/git/no-unsigned-commits.yaml](scribe-public/sample-policies.git/v2/rules/git/no-unsigned-commits.yaml)  
**Rego File Path**: `no-unsigned-commits.rego`  

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
