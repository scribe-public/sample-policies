# Rule: SLSA Field Exists in Provenance Document

**ID**: `slsa-field-exists`
**Source**: [v2/rules/slsa/field-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.yaml)
**Uses**: `slsa/field-exists@v2/rules
**Rego Source**: [field-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.rego)

**Labels**: SLSA, Image

**Short Description**: Verify the specified field exists in the provenance document.

## Evidence Requirements

```yaml
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
paths: []
violations_threshold: 0
```
