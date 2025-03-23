---
sidebar_label: Allowed GitHub Organization Admins
title: Allowed GitHub Organization Admins
---  
# Allowed GitHub Organization Admins  
**Type:** Rule  
**ID:** `github-orgallowed-admins`  
**Source:** [v2/rules/github/org/allow-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-admins.rego)  
**Labels:** GitHub, Organization  

Verify only users in the Allowed List have admin privileges in the GitHub organization.

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
uses: github/org/allow-admins@v2
with:
  allowed_admins:
    - user1
    - user2
    - user3
```

## Mitigation  
Ensures that only approved users have admin privileges in the GitHub organization, reducing the risk of unauthorized access  through compromised credentials.


## Description  
This rule verifies that only users in the Allowed List have admin privileges in the GitHub organization.
It checks the organization's details and compares the value of the 
`organization_details.admins` field against the expected value.

The rule iterates over the organization data in the evidence, and if the `admins` field does not match 
the desired value, a violation is recorded. This ensures that only users in the Allowed List have admin privileges in the GitHub organization.

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
| allowed_admins | array | False | List of allowed GitHub organization admins. |

