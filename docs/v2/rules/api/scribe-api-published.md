# Rule: Scribe Published Policy  
**ID:** `scribe-published-policy`  
**Uses:** `api/scribe-api-published@v2/rules`  
**Source:** [v2/rules/api/scribe-api-published.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api-published.yaml)  
**Rego Source:** [scribe-api-published.rego](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api-published.rego)  
**Labels:** Scribe  

Verify image Scribe Publish flag is set for container image.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |

## Rule Parameters (`with`)  
```yaml
superset:
  published: null
```

