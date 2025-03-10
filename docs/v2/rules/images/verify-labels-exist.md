# Rule: Require Image Labels

**ID**: `required-image-labels`
**Source**: [v2/rules/images/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels-exist.yaml)
**Uses**: `images/verify-labels-exist@v2/rules
**Rego Source**: [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels-exist.rego)

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
