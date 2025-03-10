# Rule: Allowed Workspace Admins

**ID**: `bb-workspace-allowed-workspace-admins`  
**Source**: [v2/rules/bitbucket/workspace/allow-admins.yaml](scribe-public/sample-policies.git/v2/rules/bitbucket/workspace/allow-admins.yaml)  
**Rego File Path**: `allow-admins.rego`  

**Labels**: Bitbucket, Workspace

**Short Description**: Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace.

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
allowed_admins: []
```
