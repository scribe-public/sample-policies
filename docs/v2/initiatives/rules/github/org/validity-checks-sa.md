---
sidebar_label: Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis
title: Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis
---  
# Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis  
**Type:** Rule  
**ID:** `github-org-validity-checks-sa`  
**Uses:** `github/org/validity-checks-sa@v2/rules`  
**Source:** [v2/rules/github/org/validity-checks-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks-sa.yaml)  
**Rego Source:** [validity-checks-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_validity_checks` is configured in the GitHub organization.

:::note 
This rule requires Unsigned Github Organization Discovery Evidence.  
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
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

