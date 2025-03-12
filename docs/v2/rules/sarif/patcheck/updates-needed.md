# SARIF Update Needed  
**Type:** Rule  
**ID:** `sarif-update-needed`  
**Uses:** `sarif/patcheck/updates-needed@v2/rules`  
**Source:** [v2/rules/sarif/patcheck/updates-needed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/patcheck/updates-needed.yaml)  
**Rego Source:** [updates-needed.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/patcheck/updates-needed.rego)  
**Labels:** SARIF  

Verify no security packages require updates.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

