# Set Push Rules in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-push-rules`  
**Uses:** `gitlab/api/push-rules@v2/rules`  
**Source:** [v2/rules/gitlab/api/push-rules.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/push-rules.yaml)  
**Rego Source:** [push-rules.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/push-rules.rego)  
**Labels:** Gitlab, API  

Verify GitLab push rules are configured via the API.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Rule Parameters (`with`)  
```yaml
api_token: '{{ .Args.Token }}'
project: '{{ .Args.Project }}'
push_rule:
  commit_message_regex: ''
  commit_message_negative_regex: null
  branch_name_regex: null
  deny_delete_tag: false
  member_check: false
  prevent_secrets: false
  author_email_regex: ''
  file_name_regex: abc
  max_file_size: 100
  commit_committer_name_check: null
  reject_unsigned_commits: null
```

