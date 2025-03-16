---
sidebar_label: Restrict Token Scopes in GitLab
title: Restrict Token Scopes in GitLab
---  
# Restrict Token Scopes in GitLab  
**Type:** Rule  
**ID:** `gitlab-org-allowed-token-scope`  
**Source:** [v2/rules/gitlab/org/allow-token-scopes.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-token-scopes.yaml)  
**Rego Source:** [allow-token-scopes.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-token-scopes.rego)  
**Labels:** Gitlab, Organization  

Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission.

:::note 
This rule requires Gitlab Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/org/allow-token-scopes@v2
with:
  allowed_token_scopes:
    - api
    - read_api
    - read_repository
    - read_registry
  
```

## Description  
This rule ensures that all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that all tokens are restricted to allowed scopes.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab organization resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_token_scopes | array | False | List of allowed token scopes in the GitLab organization. |

