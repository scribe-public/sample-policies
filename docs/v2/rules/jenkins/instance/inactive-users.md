# Rule: Verify Inactive Users

**ID**: `jenkins-inactive-users`  
**Source**: [v2/rules/jenkins/instance/inactive-users.yaml](scribe-public/sample-policies.git/v2/rules/jenkins/instance/inactive-users.yaml)  
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
