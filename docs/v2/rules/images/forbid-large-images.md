# Rule: Forbid Large Images

**ID**: `images-project-large-image`  
**Source**: [v2/rules/images/forbid-large-images.yaml](scribe-public/sample-policies.git/v2/rules/images/forbid-large-images.yaml)  
**Rego File Path**: `forbid-large-images.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify the image size is below the specified threshold.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
max_size: 77819980
```
