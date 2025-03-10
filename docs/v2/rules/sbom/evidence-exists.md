# Rule: Require SBOM Existence

**ID**: `require-sbom`  
**Source**: [v2/rules/sbom/evidence-exists.yaml](scribe-public/sample-policies.git/v2/rules/sbom/evidence-exists.yaml)  
**Rego File Path**: `evidence-exists.rego`  

**Labels**: SBOM, Blueprint

**Short Description**: Verify the SBOM exists as evidence.

## Evidence Requirements

```yaml
filter-by:
- product
- target
content_body_type: cyclonedx-json
signed: false
```
