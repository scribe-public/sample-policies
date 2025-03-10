# Rule: Allowed Repository Users

**ID**: `bb-repo-allowed-repository-users`
**Source**: [v2/rules/bitbucket/repository/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.yaml)
**Uses**: `bitbucket/repository/allow-users@v2/rules
**Rego Source**: [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.rego)

**Labels**: Bitbucket, Repository

**Short Description**: Verify only users specified in the Allowed List have user access to the Bitbucket repository.

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
allowed_users: []
```
