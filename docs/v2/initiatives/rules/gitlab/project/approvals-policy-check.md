---
sidebar_label: Merge approval policy check for GitLab project
title: Merge approval policy check for GitLab project
---  
# Merge approval policy check for GitLab project  
**Type:** Rule  
**ID:** `gitlab-project-merge-approval`  
**Uses:** `gitlab/project/approvals-policy-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/approvals-policy-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvals-policy-check.yaml)  
**Rego Source:** [approvals-policy-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvals-policy-check.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify the project's merge approval policy complies with requirements.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
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
| name | All Members |
| approvals_required_min | 2 |

