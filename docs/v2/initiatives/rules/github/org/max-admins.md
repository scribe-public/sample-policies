---
sidebar_label: Limit Admin Number in GitHub Organization
title: Limit Admin Number in GitHub Organization
---  
# Limit Admin Number in GitHub Organization  
**Type:** Rule  
**ID:** `github-org-max-admins`  
**Uses:** `github/org/max-admins@v2/rules`  
**Source:** [v2/rules/github/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/max-admins.rego)  
**Labels:** Blueprint, GitHub, Organization  

Verify the maximum number of GitHub organization admins is restricted.

:::note 
This rule requires [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery).  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_admins | 0 |

