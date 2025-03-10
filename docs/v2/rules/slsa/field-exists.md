# SLSA Field Exists in Provenance Document  
**Type:** Rule  
**ID:** `slsa-field-exists`  
**Uses:** `slsa/field-exists@v2/rules`  
**Source:** [v2/rules/slsa/field-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.yaml)  
**Rego Source:** [field-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.rego)  
**Labels:** SLSA, Image  

Verify the specified field exists in the provenance document.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
paths: []
violations_threshold: 0
```

