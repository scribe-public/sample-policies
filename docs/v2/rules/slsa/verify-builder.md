# Rule: Verify that artifact was created by the specified builder  
**ID:** `slsa-verify-builder`  
**Uses:** `slsa/verify-builder@v2/rules`  
**Source:** [v2/rules/slsa/verify-builder.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-builder.yaml)  
**Rego Source:** [verify-builder.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-builder.rego)  
**Short Description:** Verify the artifact was created by the specified builder.  
**Labels:** SLSA, Image  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['pipeline', 'product'] |
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
id: '{{ .Env.HOSTNAME }}'
```

