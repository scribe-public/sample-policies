---
sidebar_label: Restrict Selective Code Owner Removals in GitLab
title: Restrict Selective Code Owner Removals in GitLab
---  
# Restrict Selective Code Owner Removals in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-selective-code-owner-removals`  
**Uses:** `gitlab/project/selective-code-owner-removals@v2/rules`  
**Source:** [v2/rules/gitlab/project/selective-code-owner-removals.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/selective-code-owner-removals.yaml)  
**Rego Source:** [selective-code-owner-removals.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/selective-code-owner-removals.rego)  
**Labels:** Gitlab, Project  

Verify `selective_code_owner_removals` is set for the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
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
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| selective_code_owner_removals | True |

