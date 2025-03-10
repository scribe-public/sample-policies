# Verify Trivy SARIF Report Compliance  
** Type:** Rule  
**ID:** `trivy-report`  
**Uses:** `sarif/trivy/verify-trivy-report@v2/rules`  
**Source:** [v2/rules/sarif/trivy/verify-trivy-report.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/verify-trivy-report.yaml)  
**Rego Source:** [../verify-sarif.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/../verify-sarif.rego)  
**Labels:** SARIF, Trivy  

Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| tool | Trivy Vulnerability Scanner |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

## Rule Parameters (`with`)  
```yaml
rule_level: []
precision: []
rule_ids: []
ignore: []
max_allowed: 0
```

