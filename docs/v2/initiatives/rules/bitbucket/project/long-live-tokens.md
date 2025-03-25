---
sidebar_label: Prevent Long-Lived Tokens
title: Prevent Long-Lived Tokens
---  
# Prevent Long-Lived Tokens  
**Type:** Rule  
**ID:** `bb-project-long-live-tokens`  
**Source:** [v2/rules/bitbucket/project/long-live-tokens.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/long-live-tokens.yaml)  
**Rego Source:** [long-live-tokens.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/long-live-tokens.rego)  
**Labels:** Bitbucket, Project  

Verify Bitbucket API tokens expire before the maximum time to live.

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
uses: bitbucket/project/long-live-tokens@v2
with:
  max_days: 30
```

## Mitigation  
Ensure that Bitbucket API tokens expire before the maximum time to live to reduce the risk of unauthorized access.


## Description  
This rule ensures that Bitbucket API tokens expire before the maximum time to live.
It performs the following steps:

1. Checks the settings of the Bitbucket project.
2. Verifies that tokens expire before the maximum time to live.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Bitbucket project resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project<br/>- platform=bitbucket<br/>- platform_instance=bitbucket_dc |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| max_days | number | False | Maximum number of days a token can be valid. |

