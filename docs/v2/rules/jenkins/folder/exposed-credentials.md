# Rule: Verify Exposed Credentials

**ID**: `jenkins-exposed-credentials`
**Source**: [v2/rules/jenkins/folder/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/folder/exposed-credentials.yaml)
**Uses**: `jenkins/folder/exposed-credentials@v2/rules
**Rego Source**: [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/folder/exposed-credentials.rego)

**Labels**: Jenkins, Folder

**Short Description**: Verify there are no exposed credentials.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=folder
```
