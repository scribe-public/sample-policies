# Rule: Restrict Commit Authors in GitLab Project  
**ID:** `gitlab-project-allowed-commit-authors`  
**Uses:** `gitlab/project/commit-author-email-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-author-email-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-email-check.yaml)  
**Rego Source:** [commit-author-email-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only GitLab project users in the Allowed List have commit author permissions.

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
allowed_authors:
- mail@example.com
```

