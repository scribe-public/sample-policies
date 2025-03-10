# Verify Attack Vector Threshold in Trivy SARIF  
** Type:** Rule  
**ID:** `trivy-attack-vectors`  
**Uses:** `sarif/trivy/verify-trivy-attack-vector@v2/rules`  
**Source:** [v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml)  
**Rego Source:** [../verify-attack-vector.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/../verify-attack-vector.rego)  
**Labels:** SARIF, Trivy  

Verify no attack vector in the Trivy SARIF report exceeds the specified threshold.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

## Rule Parameters (`with`)  
```yaml
attack_vectors: []
violations_threshold: 0
```

