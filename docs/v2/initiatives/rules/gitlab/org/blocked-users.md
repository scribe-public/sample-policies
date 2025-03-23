---
sidebar_label: Block Users in GitLab Organization
title: Block Users in GitLab Organization
---  
# Block Users in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-blocked-users`  
**Source:** [v2/rules/gitlab/org/blocked-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/blocked-users.yaml)  
**Rego Source:** [blocked-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/blocked-users.rego)  
**Labels:** Gitlab, Organization  

Verify no users in the GitLab organization are on the block list.

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
uses: gitlab/org/blocked-users@v2
with:
  blocked_users:
    - "user1"
    - "user2"
    - "user3"
```

## Mitigation  
Ensure that no users are on the block list in the GitLab organization to reduce the risk of unauthorized access.


## Description  
This rule ensures that no users in the GitLab organization are on the block list.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that no users are on the block list.

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
| blocked_users | array | False | List of users blocked in the GitLab organization. |

