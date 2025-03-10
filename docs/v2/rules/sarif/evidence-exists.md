# Verify Required Evidence in SARIF  
** Type:** Rule  
**ID:** `required-sarif-evidence`  
**Uses:** `sarif/evidence-exists@v2/rules`  
**Source:** [v2/rules/sarif/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/evidence-exists.rego)  
**Labels:** SARIF  

Verify all required evidence exists as defined by the SARIF policy.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

