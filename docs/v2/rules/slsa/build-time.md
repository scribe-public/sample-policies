# Verify build time  
**Type:** Rule  
**ID:** `slsa-build-time`  
**Uses:** `slsa/build-time@v2/rules`  
**Source:** [v2/rules/slsa/build-time.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.yaml)  
**Rego Source:** [build-time.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.rego)  
**Labels:** SLSA, Image  

Verify the artifact was created within the specified time window.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
start_hour: 8
end_hour: 20
workdays:
- Sunday
- Monday
- Tuesday
- Wednesday
- Thursday
```

