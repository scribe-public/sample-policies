# Rule: Disallow Unused Users

**ID**: `jenkins-unused-users`  
**Source**: [v2/rules/jenkins/instance/unused-users.yaml](scribe-public/sample-policies.git/v2/rules/jenkins/instance/unused-users.yaml)  
**Rego File Path**: `unused-users.rego`  

**Labels**: Jenkins, Instance

**Short Description**: Verify there are no users with zero activity.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=instance
- platform=jenkins
```
