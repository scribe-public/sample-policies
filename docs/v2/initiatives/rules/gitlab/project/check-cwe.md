---
sidebar_label: Check CWE Compliance
title: Check CWE Compliance
---  
# Check CWE Compliance  
**Type:** Rule  
**ID:** `gitlab-project-check-cwe`  
**Uses:** `gitlab/project/check-cwe@v2/rules`  
**Source:** [v2/rules/gitlab/project/check-cwe.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-cwe.yaml)  
**Rego Source:** [check-cwe.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-cwe.rego)  
**Labels:** Gitlab, Project  

Verify that specified CWEs were not detected in the GitLab project.

:::note 
This rule requires [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery).  
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
| cwe_value | 89 |

