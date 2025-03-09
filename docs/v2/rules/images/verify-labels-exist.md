# Rule: Require Image Labels

**ID**: `required-image-labels`  
**Source YAML**: `verify-labels-exist.yaml`  
**Rego File Path**: `verify-labels-exist.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify the image has the specified labels.

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
