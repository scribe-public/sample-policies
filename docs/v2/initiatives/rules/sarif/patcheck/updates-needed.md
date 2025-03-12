---
sidebar_label: SARIF Update Needed
title: SARIF Update Needed
---  
# SARIF Update Needed  
**Type:** Rule  
**ID:** `sarif-update-needed`  
**Uses:** `sarif/patcheck/updates-needed@v2/rules`  
**Source:** [v2/rules/sarif/patcheck/updates-needed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/patcheck/updates-needed.yaml)  
**Rego Source:** [updates-needed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/patcheck/updates-needed.rego)  
**Labels:** SARIF  

Verify no security packages require updates.

:::note 
This rule requires Unsigned SARIF Evidence.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

