---
sidebar_label: Set Visibility Level in GitLab Project
title: Set Visibility Level in GitLab Project
---  
# Set Visibility Level in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-project-visibility-level`  
**Uses:** `gitlab/project/visibility-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/visibility-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/visibility-check.yaml)  
**Rego Source:** [visibility-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/visibility-check.rego)  
**Labels:** Gitlab, Project  

Verify the GitLab project's visibility matches the required level.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/platforms/discover#gitlab-discovery) for more details.  
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
| visibility | private |

