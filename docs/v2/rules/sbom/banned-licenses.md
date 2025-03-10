# Rule: Restrict Disallowed SBOM Licenses

**ID**: `sbom-disallowed-licenses`  
**Source**: [v2/rules/sbom/banned-licenses.yaml](scribe-public/sample-policies.git/v2/rules/sbom/banned-licenses.yaml)  
**Rego File Path**: `banned-licenses.rego`  

**Labels**: SBOM, Image

**Short Description**: Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold.

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
