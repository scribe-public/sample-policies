---
sidebar_label: Forbid Token Scopes in GitLab Organization
title: Forbid Token Scopes in GitLab Organization
---  
# Forbid Token Scopes in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-disallowed-token-scope`  
**Source:** [v2/rules/gitlab/org/forbid-token-scopes.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/forbid-token-scopes.yaml)  
**Rego Source:** [forbid-token-scopes.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/forbid-token-scopes.rego)  
**Labels:** Blueprint, Gitlab, Organization  

Verify no GitLab organization tokens have disallowed scopes.

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
uses: gitlab/org/forbid-token-scopes@v2
with:
  project_scopes:
    - write_api
    - write_repository
```

## Mitigation  
Ensure that no GitLab organization tokens have disallowed scopes to prevent excessive permission.


## Description  
This rule ensures that no GitLab organization tokens have disallowed scopes.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that no tokens have disallowed scopes.

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
| project_scopes | array | False | List of disallowed token scopes in the GitLab organization. |

