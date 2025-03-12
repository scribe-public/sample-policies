---
sidebar_label: Verify Branch Verification Setting
title: Verify Branch Verification Setting
---  
# Verify Branch Verification Setting  
**Type:** Rule  
**ID:** `github-repo-branch-verification`  
**Uses:** `github/repository/branch-verification@v2/rules`  
**Source:** [v2/rules/github/repository/branch-verification.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-verification.yaml)  
**Rego Source:** [branch-verification.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-verification.rego)  
**Labels:** GitHub, Repository  

Verify branch verification in the GitHub repository matches the value defined in the configuration file.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_verified | False |
