# Verify that artifact has no disallowed builder dependencies  
**Type:** Rule  
**ID:** `slsa-verify-byproducts`  
**Uses:** `slsa/verify-byproducts@v2/rules`  
**Source:** [v2/rules/slsa/verify-byproducts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-byproducts.yaml)  
**Rego Source:** [verify-byproducts.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/verify-byproducts.rego)  
**Labels:** SLSA, Image  

Verify the artifact has no disallowed builder dependencies.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
byproducts: []
```

