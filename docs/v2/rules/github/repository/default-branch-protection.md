---
sidebar_label: Verify Default Branch Protection
title: Verify Default Branch Protection
---  
# Verify Default Branch Protection  
**Type:** Rule  
**ID:** `github-repo-default-branch-protection`  
**Uses:** `github/repository/default-branch-protection@v2/rules`  
**Source:** [v2/rules/github/repository/default-branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/default-branch-protection.yaml)  
**Rego Source:** [default-branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/default-branch-protection.rego)  
**Labels:** GitHub, Repository  

Verify the default branch protection is configured in the GitHub repository.

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

