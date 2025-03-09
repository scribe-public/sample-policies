# Rule: Allowed Main Image Source

**ID**: `images-allowed-image-source`  
**Source YAML**: `allowed-image-source.yaml`  
**Rego File Path**: `allowed-image-source.rego`  

**Labels**: SBOM, Images

**Short Description**: Ensures the main container image referenced in the SBOM is from an approved source.


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
