---
sidebar_label: Allowed GitHub Organization Users
title: Allowed GitHub Organization Users
---  
# Allowed GitHub Organization Users  
**Type:** Rule  
**ID:** `github-org-allowed-users`  
**Source:** [v2/rules/github/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/allow-users.rego)  
**Labels:** GitHub, Organization  

Verify only users in the Allowed List have user access to the GitHub organization.

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
uses: github/org/allow-users@v2
with:
  allowed_users:
    - "user1"
    - "user2"
```

## Mitigation  
Ensures that only approved users have access to the GitHub organization, reducing the risk of unauthorized access.


## Description  
This rule ensures that only users specified in the allowed list have access to the GitHub organization.
It performs the following steps:

1. Iterates over the users in the GitHub organization.
2. Checks each user against the allowed list specified in the `with.allowed_users` configuration.
   - If a user is not in the allowed list, the rule flags it as a violation.

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

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_users | array | False | List of allowed users. |

