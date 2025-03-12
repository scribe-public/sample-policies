---
sidebar_label: Enable Secrets Prevention in GitLab Project
title: Enable Secrets Prevention in GitLab Project
---  
# Enable Secrets Prevention in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-prevent_secrets`  
**Uses:** `gitlab/project/prevent-secrets-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/prevent-secrets-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/prevent-secrets-check.yaml)  
**Rego Source:** [prevent-secrets-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/prevent-secrets-check.rego)  
**Labels:** Gitlab, Project  

Verify `prevent_secrets` is enabled for the GitLab project.

:::note 
This rule requires Unsigned Gitlab Project Discovery Evidence.  
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

