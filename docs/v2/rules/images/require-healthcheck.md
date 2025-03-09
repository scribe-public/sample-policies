# Rule: Require Healthcheck

**ID**: `images-require-healthcheck`  
**Source YAML**: `require-healthcheck.yaml`  
**Rego File Path**: `require-healthcheck.rego`  

**Labels**: SBOM, Images

**Short Description**: Checks that the container image includes at least one healthcheck property.
otherwise, it fails with a violation.


## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
filter-by:
- target
- product
```
