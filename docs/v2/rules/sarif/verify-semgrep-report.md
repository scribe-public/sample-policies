# Verify Semgrep Rule in SARIF  
**Type:** Rule  
**ID:** `sarif-semgrep-report`  
**Uses:** `sarif/verify-semgrep-report@v2/rules`  
**Source:** [v2/rules/sarif/verify-semgrep-report.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-semgrep-report.yaml)  
**Rego Source:** [verify-semgrep-report.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-semgrep-report.rego)  
**Labels:** SARIF, Semgrep  

Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| rule_ids | [] |
| violations_threshold | 0 |
