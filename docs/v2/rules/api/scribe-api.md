# Rule: Apply Scribe Template Policy

**ID**: `scribe-template`  
**Source**: [v2/rules/api/scribe-api.yaml](scribe-public/sample-policies.git/v2/rules/api/scribe-api.yaml)  

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
