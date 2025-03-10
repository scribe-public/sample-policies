# Set Push Rules in GitLab  
**Type:** Rule  
**ID:** `gitlab-api-push-rules`  
**Uses:** `gitlab/api/push-rules@v2/rules`  
**Source:** [v2/rules/gitlab/api/push-rules.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/push-rules.yaml)  
**Rego Source:** [push-rules.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/api/push-rules.rego)  
**Labels:** Gitlab, API  

Verify GitLab push rules are configured via the API.

> Evidence **IS NOT** required for this rule.  
> Rule Result will be set as 'open' if evidence is missing.  

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| api_token | {{ .Args.Token }} |
| project | {{ .Args.Project }} |
| push_rule | {'commit_message_regex': '', 'commit_message_negative_regex': None, 'branch_name_regex': None, 'deny_delete_tag': False, 'member_check': False, 'prevent_secrets': False, 'author_email_regex': '', 'file_name_regex': 'abc', 'max_file_size': 100, 'commit_committer_name_check': None, 'reject_unsigned_commits': None} |
