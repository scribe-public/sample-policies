# Rule: Enforce Allowed SBOM Components

**ID**: `sbom-allowed-components`  
**Source YAML**: `allowed-components.yaml`  
**Rego File Path**: `allowed-components.rego`  

**Labels**: SBOM, Image

**Short Description**: Verify the artifact contains only allowed components.

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
types:
- library
- operating-system
allowlist: []
```
