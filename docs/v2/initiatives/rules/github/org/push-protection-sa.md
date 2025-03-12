---
sidebar_label: Verify Secret_Scanning_Push_Protection Setting
title: Verify Secret_Scanning_Push_Protection Setting
---  
# Verify Secret_Scanning_Push_Protection Setting  
**Type:** Rule  
**ID:** `github-org-push-protection-sa`  
**Uses:** `github/org/push-protection-sa@v2/rules`  
**Source:** [v2/rules/github/org/push-protection-sa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection-sa.yaml)  
**Rego Source:** [push-protection-sa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning_push_protection` is configured in the GitHub repository.

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
| labels | - platform=github<br/>- asset_type=organization |

