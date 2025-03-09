# Rule: Allowed Repository Admins

**ID**: `bb-repo-allowed-repository-admins`  
**Source YAML**: `allow-admins.yaml`  
**Rego File Path**: `allow-admins.rego`  

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
