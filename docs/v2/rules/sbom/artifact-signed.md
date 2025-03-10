# Rule: Require SBOM Signature

**ID**: `sbom-signed`  
**Source**: [v2/rules/sbom/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/artifact-signed.yaml)  
**Rego File Path**: `artifact-signed.rego`  

**Labels**: SBOM, Blueprint

**Short Description**: Verify the SBOM is signed.

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
