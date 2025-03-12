---
sidebar_label: Forbid Unused Tokens in GitLab Organization
title: Forbid Unused Tokens in GitLab Organization
---  
# Forbid Unused Tokens in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-unused-tokens`  
**Uses:** `gitlab/org/unused-tokens@v2/rules`  
**Source:** [v2/rules/gitlab/org/unused-tokens.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/unused-tokens.yaml)  
**Rego Source:** [unused-tokens.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/unused-tokens.rego)  
**Labels:** Gitlab, Organization  

Verify there are no unused GitLab organization tokens.

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
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| unused_for_days | 90 |
