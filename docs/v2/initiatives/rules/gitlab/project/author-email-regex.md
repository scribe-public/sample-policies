---
sidebar_label: Set Author Email Regex in GitLab Project
title: Set Author Email Regex in GitLab Project
---  
# Set Author Email Regex in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-author-email-regex`  
**Uses:** `gitlab/project/author-email-regex@v2/rules`  
**Source:** [v2/rules/gitlab/project/author-email-regex.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/author-email-regex.yaml)  
**Rego Source:** [author-email-regex.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/author-email-regex.rego)  
**Labels:** Gitlab, Project  

Verify the `author_email_regex` for the GitLab project is set to the specified value.

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
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| author_email_regex |  |
