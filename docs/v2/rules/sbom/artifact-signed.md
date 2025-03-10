# Rule: Require SBOM Signature

**ID**: `sbom-signed`  
**Uses**: `sbom/artifact-signed@v2/rules  
**Source**: [v2/rules/sbom/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/artifact-signed.yaml)  
**Rego Source**: [artifact-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/artifact-signed.rego)  
**Short Description**: Verify the SBOM is signed.  
**Labels**: SBOM, Blueprint

## Evidence Requirements

```yaml
filter-by:
- product
- target
content_body_type: cyclonedx-json
signed: true
```
## Rule Parameters (`with`)

```yaml
identity:
  common-names: []
  emails: []
```
