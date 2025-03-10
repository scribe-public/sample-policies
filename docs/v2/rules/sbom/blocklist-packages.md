# Rule: Restrict Disallowed Dependencies

**ID**: `sbom-disallow-dependencies`
**Source**: [v2/rules/sbom/blocklist-packages.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/blocklist-packages.yaml)
**Uses**: `sbom/blocklist-packages@v2/rules
**Rego Source**: [blocklist-packages.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/blocklist-packages.rego)

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
