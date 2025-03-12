---
sidebar_label: Verify secret scanning.
title: Verify secret scanning.
---  
# Verify secret scanning.  
**Type:** Rule  
**ID:** `github-repo-validity-checks`  
**Uses:** `github/repository/validity-checks@v2/rules`  
**Source:** [v2/rules/github/repository/validity-checks.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/validity-checks.rego)  
**Labels:** GitHub, Repository  

Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories.

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
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=repository |

