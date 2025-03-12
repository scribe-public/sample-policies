---
sidebar_label: Verify No Old Secrets Exist in Repository
title: Verify No Old Secrets Exist in Repository
---  
# Verify No Old Secrets Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-old-secrets`  
**Uses:** `github/repository/old-secrets@v2/rules`  
**Source:** [v2/rules/github/repository/old-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/old-secrets.rego)  
**Labels:** GitHub, Repository  

Verify secrets in the GitHub repository are not older than the specified threshold.

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
| max_secret_age | 12 |
