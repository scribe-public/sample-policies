# Rule: Allowed Repository Users

**ID**: `bb-repo-allowed-repository-users`  
**Source YAML**: `allow-users.yaml`  
**Rego File Path**: `allow-users.rego`  

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
