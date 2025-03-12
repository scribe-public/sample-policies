---
sidebar_label: Disallow Commits to Main Branch
title: Disallow Commits to Main Branch
---  
# Disallow Commits to Main Branch  
**Type:** Rule  
**ID:** `git-disallow-commits-to-main`  
**Uses:** `git/no-commit-to-main@v2/rules`  
**Source:** [v2/rules/git/no-commit-to-main.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-commit-to-main.yaml)  
**Rego Source:** [no-commit-to-main.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-commit-to-main.rego)  
**Labels:** Git  

Verify commits made directly to the main branch are disallowed.

:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

