# Rule: Allowed Committer Emails in GitLab Project  
**ID:** `gitlab-project-allowed-committer-emails`  
**Uses:** `gitlab/project/committer-email-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/committer-email-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-email-check.yaml)  
**Rego Source:** [committer-email-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-email-check.rego)  
**Short Description:** Verify only users in the Allowed List use committer email addresses in the GitLab project.  
**Labels:** Gitlab, Project  

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
allowed_committers:
- mail@example.com
```

