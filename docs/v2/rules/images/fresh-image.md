# Rule: Fresh Image

**ID**: `fresh-image`  
**Source**: [v2/rules/images/fresh-image.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-image.yaml)  
**Rego File Path**: `fresh-image.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify the image is not older than the specified threshold.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
max_days: 183
```
