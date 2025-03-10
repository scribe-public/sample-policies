# Rule: Require SBOM Existence

**ID**: `require-sbom`  
**Uses**: `sbom/evidence-exists@v2/rules  
**Source**: [v2/rules/sbom/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/evidence-exists.yaml)  
**Rego Source**: [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/evidence-exists.rego)  
**Short Description**: Verify the SBOM exists as evidence.  
**Labels**: SBOM, Blueprint

## Evidence Requirements

```yaml
filter-by:
- product
- target
content_body_type: cyclonedx-json
signed: false
```
