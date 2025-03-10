# Rule: Restrict Disallowed SBOM Licenses

**ID**: `sbom-disallowed-licenses`  
**Uses**: `sbom/banned-licenses@v2/rules  
**Source**: [v2/rules/sbom/banned-licenses.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-licenses.yaml)  
**Rego Source**: [banned-licenses.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-licenses.rego)  
**Short Description**: Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold.  
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
blocklist: []
blocklisted_limit: 0
```
