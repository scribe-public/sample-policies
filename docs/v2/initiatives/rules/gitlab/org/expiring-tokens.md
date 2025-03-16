---
sidebar_label: Prevent Token Expiration in GitLab Organization
title: Prevent Token Expiration in GitLab Organization
---  
# Prevent Token Expiration in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-token-about-to-expire`  
**Source:** [v2/rules/gitlab/org/expiring-tokens.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/expiring-tokens.yaml)  
**Rego Source:** [expiring-tokens.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/expiring-tokens.rego)  
**Labels:** Gitlab, Organization  

Verify no GitLab organization tokens are about to expire.

:::note 
This rule requires Gitlab Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
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
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| exiring_in_days | 30 |

