---
sidebar_label: Verify `advanced_security_enabled_for_new_repositories` setting
title: Verify `advanced_security_enabled_for_new_repositories` setting
---  
# Verify `advanced_security_enabled_for_new_repositories` setting  
**Type:** Rule  
**ID:** `github-org-advanced-security`  
**Source:** [v2/rules/github/org/advanced-security.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/advanced-security.yaml)  
**Rego Source:** [advanced-security.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/advanced-security.rego)  
**Labels:** GitHub, Organization  

Verify `advanced_security` is enabled for new repositories in the GitHub organization.

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
uses: github/org/advanced-security@v2
with:
  desired_value: true
```

## Mitigation  
Enforces advanced security for new repositories in the organization, significantly reducing the risk of introducing vulnerabilities or unapproved software.


## Description  
This rule verifies that advanced security is enabled for new repositories in the GitHub organization by examining the provided Discovery evidence.
It checks the organization's details and compares the value of the 
`organization_details.advanced_security_enabled_for_new_repositories` field against the expected value.

The rule iterates over the organization data in the evidence, and if the `advanced_security_enabled_for_new_repositories` field does not match 
the desired value, a violation is recorded. This ensures that all new repositories enforce advanced security, significantly reducing the risk of 
introducing vulnerabilities or unapproved software.

### **Evidence Requirements**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| desired_value | boolean | False | Desired value for the `advanced_security_enabled_for_new_repositories` setting. |

