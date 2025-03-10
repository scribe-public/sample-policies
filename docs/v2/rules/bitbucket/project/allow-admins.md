# Rule: Allowed Project Admins

**ID**: `bb-project-allowed-project-admins`  
**Source**: [v2/rules/bitbucket/project/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-admins.yaml)  
**Rego File Path**: `allow-admins.rego`  

**Short Description**: Verify only users specified in the Allowed List have admin privileges in the Bitbucket project.

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
allowed_admins: []
```
