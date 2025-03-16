---
sidebar_label: Verify Default Branch Protection Setting Is Configured
title: Verify Default Branch Protection Setting Is Configured
---  
# Verify Default Branch Protection Setting Is Configured  
**Type:** Rule  
**ID:** `bb-repo-branch-protection`  
**Source:** [v2/rules/bitbucket/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/repository/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/repository/branch-protection.rego)  
**Labels:** Bitbucket, Repository  

Verify the default branch protection is enabled in the Bitbucket repository.

:::note 
This rule requires Bitbucket Repository Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: bitbucket/repository/branch-protection@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br/>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| branches | ['main'] |

