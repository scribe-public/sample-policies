# Rule: Enforce SBOM License Completeness

**ID**: `sbom-require-complete-license-set`
**Source**: [v2/rules/sbom/complete-licenses.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.yaml)
**Uses**: `sbom/complete-licenses@v2/rules
**Rego Source**: [complete-licenses.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.rego)

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
