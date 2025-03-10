# Rule: Verify Default Branch Protection Setting Is Configured

**ID**: `bb-repo-branch-protection`
**Source**: [v2/rules/bitbucket/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/branch-protection.yaml)
**Uses**: `bitbucket/repository/branch-protection@v2/rules
**Rego Source**: [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/branch-protection.rego)

**Labels**: Bitbucket, Repository

**Short Description**: Verify the default branch protection is enabled in the Bitbucket repository.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=bitbucket
- asset_type=repository
```
## Rule Parameters (`with`)

```yaml
branches:
- main
```
