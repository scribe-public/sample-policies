# Rule: Fresh Base Image

**ID**: `images-fresh-base-image`  
**Source YAML**: `fresh-base-image.yaml`  
**Rego File Path**: `fresh-base-image.rego`  

**Labels**: SBOM, Images

**Short Description**: Verifies that each base image is not older than the specified threshold (max_days) from its creation date. The rule fails if no base image is found or if any base image exceeds the allowed age. This rule requires Dockerfile context; for example, run it with: `valint my_image --base-image Dockerfile`.


## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
filter-by:
- target
- product
```
## Rule Parameters (`with`)

```yaml
max_days: 183
```
