# Rule: Verify Image Labels

**ID**: `image-labels`  
**Source YAML**: `verify-labels.yaml`  
**Rego File Path**: `verify-labels.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify specified labels key-value pairs exist in the image.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
labels: []
```
