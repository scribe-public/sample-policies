---
sidebar_label: Allowed Admins in GitLab Organization
title: Allowed Admins in GitLab Organization
---  
# Allowed Admins in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-admins`  
**Source:** [v2/rules/gitlab/org/allow-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-admins.rego)  
**Labels:** Gitlab, Organization  

Verify only users in the Allowed List have admin privileges in the GitLab organization.

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
uses: gitlab/org/allow-admins@v2
with:
  allowed_admins:
    - "user1"
    - "user2"
    - "user3"
```

## Mitigation  
Ensure that only users in the Allowed List have admin privileges in the GitLab organization to reduce the risk of unauthorized changes.


## Description  
This rule ensures that only users in the Allowed List have admin privileges in the GitLab organization.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that only users in the Allowed List have admin privileges.

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
| allowed_admins | array | False | List of users allowed to have admin privileges in the GitLab organization. |

