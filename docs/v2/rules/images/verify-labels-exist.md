# Rule: Require Image Labels

**ID**: `required-image-labels`  
**Source**: [v2/rules/images/verify-labels-exist.yaml](scribe-public/sample-policies.git/v2/rules/images/verify-labels-exist.yaml)  
**Rego File Path**: `verify-labels-exist.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify the image has the specified labels.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
labels: []
```
