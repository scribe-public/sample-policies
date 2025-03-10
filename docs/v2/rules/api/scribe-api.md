# Rule: Apply Scribe Template Policy

**ID**: `scribe-template`
**Source**: [v2/rules/api/scribe-api.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.yaml)
**Uses**: `api/scribe-api@v2/rules

**Labels**: Scribe

**Short Description**: Verify XX using the Scribe API template rule.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
predicate_type: https://cyclonedx.org/bom
```
## Rule Parameters (`with`)

```yaml
superset: null
```
