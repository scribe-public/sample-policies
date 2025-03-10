# Apply Scribe Template Policy  
**Type:** Rule  
**ID:** `scribe-template`  
**Uses:** `api/scribe-api@v2/rules`  
**Source:** [v2/rules/api/scribe-api.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.yaml)  
**Labels:** Scribe  

Verify XX using the Scribe API template rule.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| predicate_type | https://cyclonedx.org/bom |

## Rule Parameters (`with`)  
```yaml
superset: null
```

