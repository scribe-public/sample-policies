---
sidebar_label: Allowed Users in GitLab Organization
title: Allowed Users in GitLab Organization
---  
# Allowed Users in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-users`  
**Source:** [v2/rules/gitlab/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/allow-users.rego)  
**Labels:** Gitlab, Organization  

Verify only users in the Allowed List have access to the GitLab organization.

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
uses: gitlab/org/allow-users@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_users | [] |

