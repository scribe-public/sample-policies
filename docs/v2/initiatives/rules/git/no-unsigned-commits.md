---
sidebar_label: Disallow Unsigned Commits
title: Disallow Unsigned Commits
---  
# Disallow Unsigned Commits  
**Type:** Rule  
**ID:** `git-disallow-unsigned-commits`  
**Source:** [v2/rules/git/no-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-unsigned-commits.yaml)  
**Rego Source:** [no-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/git/no-unsigned-commits.rego)  
**Labels:** Git  

Verify all commits are signed.

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
uses: git/no-unsigned-commits@v2
```

## Mitigation  
Enforcing signed commits ensures reduced risk of unauthorized changes to the repository.


## Description  
This rule ensures that all commits are signed.
It performs the following steps:

1. Iterates over the commits in the repository.
2. For each Commit Rule inspects the 'PGPSignature' property of the commit, if it is not present, the rule flags it as a violation.

**Evidence Requirements:**
- The Source SBOM evidence must be provided in the `cyclonedx-json` format.
- The Source SBOM should include a `metadata.component.properties` array containing properties that identify base images.
- The Source SBOM (Software Bill of Materials) must include the `PGPSignature` property for each commit Component.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

