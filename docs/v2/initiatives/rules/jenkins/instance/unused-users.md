---
sidebar_label: Disallow Unused Users
title: Disallow Unused Users
---  
# Disallow Unused Users  
**Type:** Rule  
**ID:** `jenkins-unused-users`  
**Uses:** `jenkins/instance/unused-users@v2/rules`  
**Source:** [v2/rules/jenkins/instance/unused-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.yaml)  
**Rego Source:** [unused-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.rego)  
**Labels:** Jenkins, Instance  

Verify there are no users with zero activity.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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

