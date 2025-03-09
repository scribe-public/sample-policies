# Rule: SLSA Field Exists in Provenance Document

**ID**: `slsa-field-exists`  
**Source YAML**: `field-exists.yaml`  
**Rego File Path**: `field-exists.rego`  

**Labels**: SLSA, Image

**Short Description**: Verify the specified field exists in the provenance document.

## Evidence Requirements

```yaml
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
paths: []
violations_threshold: 0
```
