---
sidebar_label: Disallow Unsigned Commits
title: Disallow Unsigned Commits
---  
# Disallow Unsigned Commits  
**Type:** Rule  
**ID:** `git-disallow-unsigned-commits`  
**Uses:** `git/no-unsigned-commits@v2/rules`  
**Source:** [v2/rules/git/no-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-unsigned-commits.yaml)  
**Rego Source:** [no-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-unsigned-commits.rego)  
**Labels:** Git  

Verify all commits are signed.

:::note 
This rule requires Unsigned Git SBOM.  
::: 
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

