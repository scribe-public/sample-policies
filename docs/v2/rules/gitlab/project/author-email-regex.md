# Set Author Email Regex in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-author-email-regex`  
**Uses:** `gitlab/project/author-email-regex@v2/rules`  
**Source:** [v2/rules/gitlab/project/author-email-regex.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/author-email-regex.yaml)  
**Rego Source:** [author-email-regex.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/author-email-regex.rego)  
**Labels:** Gitlab, Project  

Verify the `author_email_regex` for the GitLab project is set to the specified value.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
author_email_regex: ''
```

