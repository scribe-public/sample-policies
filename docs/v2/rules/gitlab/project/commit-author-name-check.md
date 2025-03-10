# Allowed Commit Authors in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-commit-author-names`  
**Uses:** `gitlab/project/commit-author-name-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-author-name-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-name-check.yaml)  
**Rego Source:** [commit-author-name-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-name-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List author commits in the GitLab project.

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
- examplename
```

