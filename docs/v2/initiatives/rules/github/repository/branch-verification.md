---
sidebar_label: Verify Branch Verification Setting
title: Verify Branch Verification Setting
---  
# Verify Branch Verification Setting  
**Type:** Rule  
**ID:** `github-repo-branch-verification`  
**Uses:** `github/repository/branch-verification@v2/rules`  
**Source:** [v2/rules/github/repository/branch-verification.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/branch-verification.yaml)  
**Rego Source:** [branch-verification.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/branch-verification.rego)  
**Labels:** GitHub, Repository  

Verify branch verification in the GitHub repository matches the value defined in the configuration file.

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
| labels | - platform=github<br/>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_verified | False |
