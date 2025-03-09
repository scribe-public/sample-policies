# Rule: Prevent Credential Exposure

**ID**: `bb-project-exposed-credentials`  
**Source YAML**: `exposed-credentials.yaml`  
**Rego File Path**: `exposed-credentials.rego`  

**Labels**: Bitbucket, Project

**Short Description**: Verify access to the Bitbucket project is blocked if exposed credentials are detected.

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
