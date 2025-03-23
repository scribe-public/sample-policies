---
sidebar_label: Verify No Old Secrets Exist in Repository
title: Verify No Old Secrets Exist in Repository
---  
# Verify No Old Secrets Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-old-secrets`  
**Source:** [v2/rules/github/repository/old-secrets.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/old-secrets.rego)  
**Labels:** GitHub, Repository  

Verify secrets in the GitHub repository are not older than the specified threshold.

:::note 
This rule requires Github Repository Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/repository/old-secrets@v2
```

## Mitigation  
Ensures that secrets are rotated regularly, reducing the risk of compromised secrets.


## Description  
This rule ensures that secrets in the GitHub repository are not older than the specified threshold.
It performs the following steps:

1. Checks the repository settings for secrets.
2. Verifies that the age of each secret does not exceed the specified threshold.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository settings.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=repository |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_secret_age | 12 |

