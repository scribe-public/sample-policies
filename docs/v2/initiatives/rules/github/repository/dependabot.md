---
sidebar_label: Verify Dependabot security updates setting
title: Verify Dependabot security updates setting
---  
# Verify Dependabot security updates setting  
**Type:** Rule  
**ID:** `github-repo-dependabot`  
**Source:** [v2/rules/github/repository/dependabot.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/dependabot.yaml)  
**Rego Source:** [dependabot.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/dependabot.rego)  
**Labels:** GitHub, Repository  

Verify Dependabot security updates are configured in the GitHub repository.

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
uses: github/repository/dependabot@v2
```

## Mitigation  
Ensures that Dependabot security updates are enabled, reducing the risk of vulnerabilities in dependencies.


## Description  
This rule ensures that Dependabot security updates are configured in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for Dependabot security updates configuration.
2. Verifies that the configuration matches the expected settings.

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

