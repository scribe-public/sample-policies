---
sidebar_label: Set Push Rules in GitLab
title: Set Push Rules in GitLab
---  
# Set Push Rules in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-push-rules`  
**Source:** [v2/rules/gitlab/api/push-rules.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/push-rules.yaml)  
**Rego Source:** [push-rules.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/api/push-rules.rego)  
**Labels:** Gitlab, API  

Verify GitLab push rules are configured via the API.

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/api/push-rules@v2
with:
  api_token: '{{ .Args.Token }}'
  project: my_project
  push_rule:
    commit_message_regex: .*hotfix:.*
    commit_message_negative_regex: .*fixme.*
    branch_name_regex: .*main.*
    deny_delete_tag: true
    member_check: true
    prevent_secrets: true
    author_email_regex: .*@example.com
    file_name_regex: "abc"
    max_file_size: 100
    commit_committer_name_check: "enabled"
    reject_unsigned_commits: "enabled"
```

## Description  
This rule ensures that GitLab push rules are configured via the API.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the push rules are configured via the API.
2.1 Verifies that the push rules are configured with the proper settings.
2.2 Verifies that the push rules are configured with the proper regular expressions.
2.3 Verifies that the push rules are configured with the proper file size.
2.4 Verifies that the push rules are configured with the proper member check.
2.5 Verifies that the push rules are configured with the proper secrets prevention.
2.6 Verifies that the push rules are configured with the proper tag deletion prevention.
2.7 Verifies that the push rules are configured with the proper author email regular expression.
2.8 Verifies that the push rules are configured with the proper file name regular expression.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab project resources.
- GitLab API token must be provided to access the GitLab API.

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| api_token | string | True | GitLab API access token. |
| project | string | True | GitLab project name. |
| push_rule | object | True | GitLab push rules. |

