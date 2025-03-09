# Rule: Verify Inactive Users

**ID**: `jenkins-inactive-users`  
**Source YAML**: `inactive-users.yaml`  
**Rego File Path**: `inactive-users.rego`  

**Labels**: Jenkins, Instance

**Short Description**: Verify there are no inactive users.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=instance
- platform=jenkins
```
## Rule Parameters (`with`)

```yaml
inactive_for_days: 90
```
