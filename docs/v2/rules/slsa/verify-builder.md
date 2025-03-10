# Rule: Verify that artifact was created by the specified builder

**ID**: `slsa-verify-builder`  
**Source**: [v2/rules/slsa/verify-builder.yaml](scribe-public/sample-policies.git/v2/rules/slsa/verify-builder.yaml)  
**Rego File Path**: `verify-builder.rego`  

**Labels**: SLSA, Image

**Short Description**: Verify the artifact was created by the specified builder.

## Evidence Requirements

```yaml
filter-by:
- pipeline
- product
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
id: '{{ .Env.HOSTNAME }}'
```
