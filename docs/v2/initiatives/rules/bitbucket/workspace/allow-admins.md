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

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br/>- asset_type=workspace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_admins | [] |

