---
sidebar_label: Verify secret_scanning setting
title: Verify secret_scanning setting
---  
# Verify secret_scanning setting  
**Type:** Rule  
**ID:** `github-repo-secret-scanning`  
**Uses:** `github/repository/secret-scanning@v2/rules`  
**Source:** [v2/rules/github/repository/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/secret-scanning.yaml)  
**Rego Source:** [secret-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/secret-scanning.rego)  
**Labels:** GitHub, Repository  

Verify `secret_scanning` is configured in the GitHub repository.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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
| labels | - platform=github<br/>- asset_type=repository |

