---
sidebar_label: Run SAST Scanning in GitLab Project
title: Run SAST Scanning in GitLab Project
---  
# Run SAST Scanning in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-sast-scanning`  
**Uses:** `gitlab/project/sast-scanning@v2/rules`  
**Source:** [v2/rules/gitlab/project/sast-scanning.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scanning.yaml)  
**Rego Source:** [sast-scanning.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scanning.rego)  
**Labels:** Gitlab, Project  

Verify SAST scanning is performed for the GitLab project.

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

