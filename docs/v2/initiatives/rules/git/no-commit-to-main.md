---
sidebar_label: Disallow Commits to Main Branch
title: Disallow Commits to Main Branch
---  
# Disallow Commits to Main Branch  
**Type:** Rule  
**ID:** `git-disallow-commits-to-main`  
**Source:** [v2/rules/git/no-commit-to-main.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-commit-to-main.yaml)  
**Rego Source:** [no-commit-to-main.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-commit-to-main.rego)  
**Labels:** SBOM, Git  

Verify commits made directly to the main branch are disallowed.

:::note 
This rule requires Git SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
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

## Usage example

```yaml
uses: git/no-commit-to-main@v2/rules
```

## Mitigation  
Enforcing no commits to the main branch ensures that changes are made through pull requests, allowing for code review and approval before merging.



## Description  
This rule ensures that no commits are made directly to the main or master branches.
It performs the following steps:

1. Check SBOM target branch
2. If the target branch is the main or master branch, the rule looks for commit objects.
3. If commit objects are found, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Git repository resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

