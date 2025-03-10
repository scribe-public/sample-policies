# Rule: Apply Scribe Template Policy  
**ID:** `scribe-template`  
**Uses:** `api/scribe-api@v2/rules`  
**Source:** [v2/rules/api/scribe-api.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.yaml)  
**Short Description:** Verify XX using the Scribe API template rule.  
**Labels:** Scribe  
> Evidence for this rule **IS NOT** required by default but is recommended


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

