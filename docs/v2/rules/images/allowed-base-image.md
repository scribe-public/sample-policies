# Rule: Allowed Base Image

**ID**: `images-allowed-base-image`  
**Source YAML**: `allowed-base-image.yaml`  
**Rego File Path**: `allowed-base-image.rego`  

**Labels**: SBOM, Images

**Short Description**: Verifies that every base image is from an approved source. The rule returns a summary
including the component names and versions of valid base images, or lists the invalid ones.
This rule requires Dockerfile context; for example, run it with:
`valint my_image --base-image Dockerfile`.


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
approved_sources: []
```
