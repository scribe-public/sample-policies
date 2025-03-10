# Rule: Require Specified SBOM Licenses

**ID**: `sbom-hf-license`  
**Uses**: `sbom/verify-huggingface-license@v2/rules  
**Source**: [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/verify-huggingface-license.yaml)  
**Rego Source**: [verify-hf-license.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/verify-hf-license.rego)  
**Short Description**: Verify the artifact includes all specified licenses.  
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
licenses: []
```
