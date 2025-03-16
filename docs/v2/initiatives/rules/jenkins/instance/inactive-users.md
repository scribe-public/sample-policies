---
sidebar_label: Verify Inactive Users
title: Verify Inactive Users
---  
# Verify Inactive Users  
**Type:** Rule  
**ID:** `jenkins-inactive-users`  
**Uses:** `jenkins/instance/inactive-users@v2/rules`  
**Source:** [v2/rules/jenkins/instance/inactive-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/instance/inactive-users.yaml)  
**Rego Source:** [inactive-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/instance/inactive-users.rego)  
**Labels:** Jenkins, Instance  

Verify there are no inactive users.

:::note 
This rule requires Jenkins Instance Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) for more details.  
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
| labels | - asset_type=instance<br/>- platform=jenkins |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| inactive_for_days | 90 |

