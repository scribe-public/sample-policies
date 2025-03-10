# Rule: Verify Image Labels

**ID**: `image-labels`  
**Source**: [v2/rules/images/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.yaml)  
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
