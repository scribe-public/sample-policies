---
sidebar_label: Restrict Coding Permissions
title: Restrict Coding Permissions
---  
# Restrict Coding Permissions  
**Type:** Rule  
**ID:** `git-coding-permissions`  
**Uses:** `git/coding-permissions@v2/rules`  
**Source:** [v2/rules/git/coding-permissions.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/coding-permissions.yaml)  
**Rego Source:** [coding-permissions.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/coding-permissions.rego)  
**Labels:** Git  

Verify only allowed users committed to the repository.

:::note 
This rule requires [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom).  
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

## Mitigation  
Prevent unauthorized users from committing to the repository by restricting coding permissions.



## Description  
This rule verifies that only allowed users have committed to the repository.
It performs the following steps:

1. Iterates over the commits in the repository.
2. Checks each commit's author against the list of allowed user IDs.
   - If a commit's author is not in the allowed list, the rule flags it as a violation.
3. Checks each committed file against the list of allowed files.
   - If a committed file is not in the allowed list, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Git repository resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| ids | array | False | The list of user (commit.author) IDs allowed to commit to the repository. |
| files | array | False | The list of files that are allowed to be committed to the repository. |

