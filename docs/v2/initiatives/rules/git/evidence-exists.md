---
sidebar_label: Required Git Evidence Exists
title: Required Git Evidence Exists
---  
# Required Git Evidence Exists  
**Type:** Rule  
**ID:** `required-git-evidence`  
**Uses:** `git/evidence-exists@v2/rules`  
**Source:** [v2/rules/git/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/evidence-exists.rego)  
**Labels:** Git  

Verify required Git evidence exists.

:::note 
This rule requires [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom).  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
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

