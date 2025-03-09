# Rule: Verify that artifact was created by the specified builder

**ID**: `slsa-verify-builder`  
**Source YAML**: `verify-builder.yaml`  
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
