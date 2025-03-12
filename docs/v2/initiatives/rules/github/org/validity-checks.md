---
sidebar_label: Verify Secret_Scanning_Validity_Checks_Enabled Setting
title: Verify Secret_Scanning_Validity_Checks_Enabled Setting
---  
# Verify Secret_Scanning_Validity_Checks_Enabled Setting  
**Type:** Rule  
**ID:** `github-org-validity-checks`  
**Uses:** `github/org/validity-checks@v2/rules`  
**Source:** [v2/rules/github/org/validity-checks.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/validity-checks.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_validity_checks` is configured in the GitHub repository.

:::note 
This rule requires Github Organization Discovery Evidence.  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | False |
