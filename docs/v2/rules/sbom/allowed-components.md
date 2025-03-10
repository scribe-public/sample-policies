# Rule: Enforce Allowed SBOM Components

**ID**: `sbom-allowed-components`  
**Uses**: `sbom/allowed-components@v2/rules  
**Source**: [v2/rules/sbom/allowed-components.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/allowed-components.yaml)  
**Rego Source**: [allowed-components.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/allowed-components.rego)  
**Short Description**: Verify the artifact contains only allowed components.  
**Labels**: SBOM, Image

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
