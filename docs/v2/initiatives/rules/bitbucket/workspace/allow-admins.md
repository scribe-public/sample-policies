---
sidebar_label: Allowed Workspace Admins
title: Allowed Workspace Admins
---  
# Allowed Workspace Admins  
**Type:** Rule  
**ID:** `bb-workspace-allowed-workspace-admins`  
**Source:** [v2/rules/bitbucket/workspace/allow-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/workspace/allow-admins.rego)  
**Labels:** Bitbucket, Workspace  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace.

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
uses: bitbucket/workspace/allow-admins@v2
with:
  allowed_admins:
    - "user1"
    - "user2"
    - "user3"
  
```

## Mitigation  
Ensure that only users in the Allowed List have admin privileges in the Bitbucket workspace to reduce the risk of unauthorized changes.



## Description  
This rule ensures that only users in the Allowed List have admin privileges in the Bitbucket workspace.
It performs the following steps:

1. Checks the settings of the Bitbucket workspace.
2. Verifies that only users in the Allowed List have admin privileges.

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
| allowed_admins | array | False | List of users allowed to have admin privileges in the Bitbucket workspace. |

