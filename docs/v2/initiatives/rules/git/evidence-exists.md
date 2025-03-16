---
sidebar_label: Required Git Evidence Exists
title: Required Git Evidence Exists
---  
# Required Git Evidence Exists  
**Type:** Rule  
**ID:** `required-git-evidence`  
**Source:** [v2/rules/git/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/evidence-exists.rego)  
**Labels:** SBOM, Git  

Verify required Git evidence exists.

:::note 
This rule requires Git SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
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

## Usage example

```yaml
uses: git/evidence-exists@v2/rules
```

## Mitigation  
By confirming that all required evidence exists, this rule guarantees that a Source Code Bill of Materials (SBOM) is fully represented as evidence.



## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

