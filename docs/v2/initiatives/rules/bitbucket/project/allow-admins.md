---
sidebar_label: Allowed Project Admins
title: Allowed Project Admins
---  
# Allowed Project Admins  
**Type:** Rule  
**ID:** `bb-project-allowed-project-admins`  
**Source:** [v2/rules/bitbucket/project/allow-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/allow-admins.rego)  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket project.

:::note 
This rule requires Bitbucket Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: bitbucket/project/allow-admins@v2
with:
  allowed_admins:
    - "user1"
    - "user2"
    - "user3"
```

## Mitigation  
Ensure that only users in the Allowed List have admin privileges in the Bitbucket project to reduce the risk of unauthorized changes.


## Description  
This rule ensures that only users in the Allowed List have admin privileges in the Bitbucket project.
It performs the following steps:

1. Checks the settings of the Bitbucket project.
2. Verifies that only users in the Allowed List have admin privileges.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Bitbucket project resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br/>- asset_type=project |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_admins | array | False | List of users allowed to have admin privileges in the Bitbucket project. |

