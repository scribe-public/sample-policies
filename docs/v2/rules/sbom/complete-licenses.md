# Rule: Enforce SBOM License Completeness

**ID**: `sbom-require-complete-license-set`  
**Source**: [v2/rules/sbom/complete-licenses.yaml](scribe-public/sample-policies.git/v2/rules/sbom/complete-licenses.yaml)  
**Rego File Path**: `complete-licenses.rego`  

**Labels**: SBOM, Image

**Short Description**: Verify all dependencies in the artifact have a license.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: container
```
