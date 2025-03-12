---
sidebar_label: Verify members_can_create_private_repositories setting
title: Verify members_can_create_private_repositories setting
---  
# Verify members_can_create_private_repositories setting  
**Type:** Rule  
**ID:** `github-org-create-private-repos`  
**Uses:** `github/org/create-private-repos@v2/rules`  
**Source:** [v2/rules/github/org/create-private-repos.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/create-private-repos.yaml)  
**Rego Source:** [create-private-repos.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/create-private-repos.rego)  
**Labels:** GitHub, Organization  

Verify `members_can_create_private_repositories` is configured in the GitHub organization (supported only in GitHub Enterprise).

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
| desired_value | True |
