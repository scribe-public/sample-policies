---
sidebar_label: Verify Commit Message Format
title: Verify Commit Message Format
---  
# Verify Commit Message Format  
**Type:** Rule  
**ID:** `gitlab-project-verify-commit_message_check`  
**Source:** [v2/rules/gitlab/project/commit-message-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-message-check.yaml)  
**Rego Source:** [commit-message-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-message-check.rego)  
**Labels:** Gitlab, Project  

Verify that commit messages in the GitLab project adhere to the specified format template.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/project/commit-message-check@v2
with:
  commit_message_regex: ".*JIRA-\\d+.*"
  
```

## Mitigation  
Ensure that commit messages adhere to the specified format template to maintain consistency and readability.



## Description  
This rule ensures that commit messages in the GitLab project adhere to the specified format template.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that commit messages adhere to the specified format template.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab project resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| commit_message_regex | string | True | The regular expression to match the commit message format. |

