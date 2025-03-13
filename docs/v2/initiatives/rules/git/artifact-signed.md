---
sidebar_label: Git Artifact Signed
title: Git Artifact Signed
---  
# Git Artifact Signed  
**Type:** Rule  
**ID:** `git-artifact-signed`  
**Uses:** `git/artifact-signed@v2/rules`  
**Source:** [v2/rules/git/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/artifact-signed.rego)  
**Labels:** Git  

Verify the Git artifact is signed.

:::note 
This rule requires Signed [Git SBOM](https://scribe-security.netlify.app/docs/docs/valint/sbom).  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS** required by default.  
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
| signed | True |
| content_body_type | cyclonedx-json |
| target_type | git |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| identity | `{'common-names': [], 'emails': []}` |

