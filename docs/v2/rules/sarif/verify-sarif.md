# Verify Rule Compliance in SARIF  
**Type:** Rule  
**ID:** `sarif-policy`  
**Uses:** `sarif/verify-sarif@v2/rules`  
**Source:** [v2/rules/sarif/verify-sarif.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-sarif.yaml)  
**Rego Source:** [verify-sarif.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-sarif.rego)  
**Labels:** SARIF  

Verify the SARIF report complies with defined generic rules for compliance and security.

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
| rule_level | [] |
| precision | [] |
| rule_ids | [] |
| ignore | [] |
| max_allowed | 0 |
