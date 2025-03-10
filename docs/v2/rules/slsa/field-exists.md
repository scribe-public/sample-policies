# Rule: SLSA Field Exists in Provenance Document  
**ID:** `slsa-field-exists`  
**Uses:** `slsa/field-exists@v2/rules`  
**Source:** [v2/rules/slsa/field-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.yaml)  
**Rego Source:** [field-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/field-exists.rego)  
**Short Description:** Verify the specified field exists in the provenance document.  
**Labels:** SLSA, Image  

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

