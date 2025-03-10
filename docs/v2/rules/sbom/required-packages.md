# Rule: Enforce SBOM Dependencies

**ID**: `sbom-required-dependencies`  
**Uses**: `sbom/required-packages@v2/rules  
**Source**: [v2/rules/sbom/required-packages.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/required-packages.yaml)  
**Rego Source**: [required-packages.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/required-packages.rego)  
**Short Description**: Verify the artifact includes all required dependencies.  
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
required_pkgs: []
violations_limit: 0
```
