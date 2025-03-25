---
sidebar_label: Verify `secret_scanning` Setting in `security_and_analysis`
title: Verify `secret_scanning` Setting in `security_and_analysis`
---  
# Verify `secret_scanning` Setting in `security_and_analysis`  
**Type:** Rule  
**ID:** `github-org-secret-scanning-sa`  
**Source:** [v2/rules/github/org/secret-scanning-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning-sa.yaml)  
**Rego Source:** [secret-scanning-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning` is configured in the GitHub repository.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/org/secret-scanning-sa@v2
```

## Mitigation  
Ensure that the Secret Scanning setting is enabled to detect and prevent the exposure of secrets in the organization’s repositories, enhancing security.


## Description  
This rule checks if the `secret_scanning` setting is enabled to detect and prevent the exposure of secrets in the organization’s repositories.
It performs the following steps:

1. Checks the secret scanning settings of the GitHub organization.
2. Verifies that the secret scanning setting is enabled.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

