# Rule: Allowed Repository Admins

**ID**: `bb-repo-allowed-repository-admins`
**Source**: [v2/rules/bitbucket/repository/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.yaml)
**Uses**: `bitbucket/repository/allow-admins@v2/rules
**Rego Source**: [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.rego)

**Labels**: Bitbucket, Repository

**Short Description**: Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository.

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
allowed_admins: []
```
