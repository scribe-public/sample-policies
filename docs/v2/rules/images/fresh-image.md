# Rule: Fresh Image

**ID**: `fresh-image`  
**Uses**: `images/fresh-image@v2/rules  
**Source**: [v2/rules/images/fresh-image.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-image.yaml)  
**Rego Source**: [fresh-image.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-image.rego)  
**Short Description**: Verify the image is not older than the specified threshold.  
**Labels**: SBOM, Images

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
