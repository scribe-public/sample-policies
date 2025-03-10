# Rule: Allowed Workspace Users

**ID**: `bb-workspace-allowed-workspace-users`  
**Source**: [v2/rules/bitbucket/workspace/allow-users.yaml](scribe-public/sample-policies.git/v2/rules/bitbucket/workspace/allow-users.yaml)  
**Rego File Path**: `allow-users.rego`  

**Labels**: Bitbucket, Workspace

**Short Description**: Verify only users specified in the Allowed List have user access to the Bitbucket workspace.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=bitbucket
- asset_type=workspace
```
## Rule Parameters (`with`)

```yaml
allowed_users: []
```
