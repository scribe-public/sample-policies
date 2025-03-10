# Rule: Require Specified SBOM Licenses

**ID**: `sbom-hf-license`
**Source**: [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/verify-huggingface-license.yaml)
**Uses**: `sbom/verify-huggingface-license@v2/rules
**Rego File Path**: `verify-hf-license.rego`

**Labels**: SBOM, Image

**Short Description**: Verify the artifact includes all specified licenses.

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
