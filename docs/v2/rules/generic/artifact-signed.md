# Rule: Generic Artifact Signed

**ID**: `generic-artifact-signed`  
**Source**: [v2/rules/generic/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/artifact-signed.yaml)  
**Rego File Path**: `artifact-signed.rego`  

**Labels**: 3rd-party

**Short Description**: Verify required evidence is signed.

## Evidence Requirements

```yaml
signed: true
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/generic/v0.1
```
