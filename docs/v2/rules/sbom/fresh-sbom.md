# Rule: Enforce SBOM Freshness

**ID**: `fresh-sbom`  
**Source**: [v2/rules/sbom/fresh-sbom.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/fresh-sbom.yaml)  
**Rego File Path**: `fresh-sbom.rego`  

**Labels**: SBOM

**Short Description**: Verify the SBOM is not older than the specified duration.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
```
## Rule Parameters (`with`)

```yaml
max_days: 30
```
