---
sidebar_label: Verify Only Ephemeral Runners Exist in Repository
title: Verify Only Ephemeral Runners Exist in Repository
---  
# Verify Only Ephemeral Runners Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-ephemeral-runners-only`  
**Uses:** `github/repository/ephemeral-runners-only@v2/rules`  
**Source:** [v2/rules/github/repository/ephemeral-runners-only.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/ephemeral-runners-only.yaml)  
**Rego Source:** [ephemeral-runners-only.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/ephemeral-runners-only.rego)  
**Labels:** GitHub, Repository  

Verify self-hosted runners are disallowed in the GitHub repository.

:::note 
This rule requires Github Repository Discovery Evidence.  
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

