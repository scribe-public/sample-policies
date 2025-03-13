---
sidebar_label: Verify Commit Message Format
title: Verify Commit Message Format
---  
# Verify Commit Message Format  
**Type:** Rule  
**ID:** `gitlab-project-verify-commit_message_check`  
**Uses:** `gitlab/project/commit-message-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-message-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-message-check.yaml)  
**Rego Source:** [commit-message-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-message-check.rego)  
**Labels:** Gitlab, Project  

Verify that commit messages in the GitLab project adhere to the specified format template.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| commit_message_regex | .*JIRA-\d+.* |

