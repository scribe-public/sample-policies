# Rule: Check Message Substring  
**ID:** `gitlab-project-message-substring-check`  
**Uses:** `gitlab/project/message-substring-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/message-substring-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/message-substring-check.yaml)  
**Rego Source:** [message-substring-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/message-substring-check.rego)  
**Labels:** Gitlab, Project  

Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project.

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
pattern: (?i)dghd
```

