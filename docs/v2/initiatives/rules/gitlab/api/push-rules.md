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
    member_check: true
    max_file_size: 100
    prevent_secrets: true
    deny_delete_tag: true
    author_email_regex: .*@example.com
    file_name_regex: "abc"
    commit_committer_name_check: "enabled"
    reject_unsigned_commits: "enabled"
```

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| api_token | string | True | GitLab API access token. |
| project | string | True | GitLab project name. |
| push_rule | object | True | GitLab push rules. |

