# Rule: Allowed Project Users

**ID**: `bb-project-allowed-project-users`  
**Source**: [v2/rules/bitbucket/project/allow-users.yaml](scribe-public/sample-policies.git/v2/rules/bitbucket/project/allow-users.yaml)  
**Rego File Path**: `allow-users.rego`  

**Short Description**: Verify only users specified in the Allowed List have user access to the Bitbucket project.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=bitbucket
- asset_type=project
```
## Rule Parameters (`with`)

```yaml
allowed_users: []
```
