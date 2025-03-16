---
sidebar_label: Allowed Workspace Users
title: Allowed Workspace Users
---  
# Allowed Workspace Users  
**Type:** Rule  
**ID:** `bb-workspace-allowed-workspace-users`  
**Source:** [v2/rules/bitbucket/workspace/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-users.rego)  
**Labels:** Bitbucket, Workspace  

Verify only users specified in the Allowed List have user access to the Bitbucket workspace.

:::note 
This rule requires Bitbucket Workspace Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: bitbucket/workspace/allow-users@v2
with:
  allowed_users:
    - "user1"
    - "user2"
    - "user3"
  
```

## Mitigation  
Ensure that only users in the Allowed List have user access to the Bitbucket workspace to reduce the risk of unauthorized access.


## Description  
This rule ensures that only users in the Allowed List have user access to the Bitbucket workspace.
It performs the following steps:

1. Checks the settings of the Bitbucket workspace.
2. Verifies that only users in the Allowed List have user access.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Bitbucket workspace resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br/>- asset_type=workspace |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_users | array | False | List of users allowed to have user access to the Bitbucket workspace. |

