---
sidebar_label: Reject Unsigned Commits in GitLab Project
title: Reject Unsigned Commits in GitLab Project
---  
# Reject Unsigned Commits in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-disallow-unsigned-commits`  
**Uses:** `gitlab/project/reject-unsigned-commits@v2/rules`  
**Source:** [v2/rules/gitlab/project/reject-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/reject-unsigned-commits.yaml)  
**Rego Source:** [reject-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/reject-unsigned-commits.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify `reject_unsigned_commits` is enabled for the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://scribe-security.netlify.app/platforms/discover#gitlab-discovery) for more details.  
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

