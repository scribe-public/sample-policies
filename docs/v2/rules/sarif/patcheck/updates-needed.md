# Rule: SARIF Update Needed  
**ID:** `sarif-update-needed`  
**Uses:** `sarif/patcheck/updates-needed@v2/rules`  
**Source:** [v2/rules/sarif/patcheck/updates-needed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/patcheck/updates-needed.yaml)  
**Rego Source:** [updates-needed.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/patcheck/updates-needed.rego)  
**Short Description:** Verify no security packages require updates.  
**Labels:** SARIF  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

