---
sidebar_label: Limit Admins in GitLab Organization
title: Limit Admins in GitLab Organization
---  
# Limit Admins in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-max-admins`  
**Source:** [v2/rules/gitlab/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/max-admins.rego)  
**Labels:** Blueprint, GitLab, Organization  

Verify the maximum number of admins for the GitLab project is restricted.

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
uses: gitlab/org/max-admins@v2
with:
  max_admins: 0
  
```

## Mitigation  
Ensure that the maximum number of admins for the GitLab project is restricted to reduce the risk of unauthorized changes.


## Description  
This rule ensures that the maximum number of admins for the GitLab project is restricted.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that the maximum number of admins is restricted.

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
| max_admins | number | False | Maximum number of admins allowed in the GitLab organization. |

