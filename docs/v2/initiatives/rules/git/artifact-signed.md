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
**Labels:** SBOM, Git  

Verify the Git artifact is signed.

:::note 
This rule requires Signed Git SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/valint/sbom) for more details.  
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

## Usage example

```yaml
uses: git/artifact-signed@v2/rules
with:
  identity:
    emails:
      - bob@company.com
      - alice@company.com
    skip_image_regex:
    - .*alpine.*
```

## Mitigation  
Ensure that only Git artifacts with valid cryptographic signatures are deployed to prevent source code tampering.



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

