---
sidebar_label: Forbid Token Scopes in GitLab Organization
title: Forbid Token Scopes in GitLab Organization
---  
# Forbid Token Scopes in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-disallowed-token-scope`  
**Uses:** `gitlab/org/forbid-token-scopes@v2/rules`  
**Source:** [v2/rules/gitlab/org/forbid-token-scopes.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.yaml)  
**Rego Source:** [forbid-token-scopes.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.rego)  
**Labels:** Blueprint, Gitlab, Organization  

Verify no GitLab organization tokens have disallowed scopes.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
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
| project_scopes | ['write_api', 'write_repository'] |
