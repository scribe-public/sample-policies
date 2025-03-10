# Rule: Generic Artifact Signed

**ID**: `generic-artifact-signed`  
**Uses**: `generic/artifact-signed@v2/rules  
**Source**: [v2/rules/generic/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/artifact-signed.yaml)  
**Rego Source**: [artifact-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/generic/artifact-signed.rego)  
**Short Description**: Verify required evidence is signed.  
**Labels**: 3rd-party

## Evidence Requirements

```yaml
signed: true
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/generic/v0.1
```
