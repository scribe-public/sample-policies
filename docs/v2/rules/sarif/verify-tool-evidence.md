# Rule: Verify Tool Evidence in SARIF  
**ID:** `sarif-tool-evidence`  
**Uses:** `sarif/verify-tool-evidence@v2/rules`  
**Source:** [v2/rules/sarif/verify-tool-evidence.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-tool-evidence.yaml)  
**Rego Source:** [verify-tool-evidence.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-tool-evidence.rego)  
**Short Description:** Verify required tools were used to generate the SARIF report.  
**Labels:** SARIF  
> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| tool | semgrep |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

