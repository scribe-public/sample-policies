# Rule: Enforce SBOM Dependencies

**ID**: `sbom-required-dependencies`  
**Source YAML**: `required-packages.yaml`  
**Rego File Path**: `required-packages.rego`  

**Labels**: SBOM, Image

**Short Description**: Verify the artifact includes all required dependencies.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
required_pkgs: []
violations_limit: 0
```
