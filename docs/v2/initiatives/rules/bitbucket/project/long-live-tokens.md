---
sidebar_label: Prevent Long-Lived Tokens
title: Prevent Long-Lived Tokens
---  
# Prevent Long-Lived Tokens  
**Type:** Rule  
**ID:** `bb-project-long-live-tokens`  
**Uses:** `bitbucket/project/long-live-tokens@v2/rules`  
**Source:** [v2/rules/bitbucket/project/long-live-tokens.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/long-live-tokens.yaml)  
**Rego Source:** [long-live-tokens.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/long-live-tokens.rego)  
**Labels:** Bitbucket, Project  

Verify Bitbucket API tokens expire before the maximum time to live.

:::note 
This rule requires Bitbucket Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/platforms/discover#bitbucket-discovery) for more details.  
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
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project<br/>- platform=bitbucket<br/>- platform_instance=bitbucket_dc |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_days | 30 |

