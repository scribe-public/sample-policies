# Verify IaC Misconfiguration Threshold in SARIF  
**Type:** Rule  
**ID:** `sarif-iac-findings`  
**Uses:** `sarif/report-iac-errors@v2/rules`  
**Source:** [v2/rules/sarif/report-iac-errors.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/report-iac-errors.yaml)  
**Rego Source:** [report-iac-errors.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/report-iac-errors.rego)  
**Labels:** SARIF  

Verify the number of infrastructure-as-code (IaC) errors in the SARIF report remains below the specified threshold.

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
violations_threshold: 0
```

