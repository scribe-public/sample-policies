# Rule: Restrict Disallowed Dependencies

**ID**: `sbom-disallow-dependencies`  
**Source YAML**: `blocklist-packages.yaml`  
**Rego File Path**: `blocklist-packages.rego`  

**Labels**: SBOM, Image, Blueprint

**Short Description**: Verify the number of disallowed dependencies remains below the specified threshold.

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
blocklist: []
blocklisted_limit: 0
```
