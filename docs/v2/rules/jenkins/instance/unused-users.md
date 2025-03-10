# Rule: Disallow Unused Users

**ID**: `jenkins-unused-users`
**Source**: [v2/rules/jenkins/instance/unused-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.yaml)
**Uses**: `jenkins/instance/unused-users@v2/rules
**Rego Source**: [unused-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.rego)

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
