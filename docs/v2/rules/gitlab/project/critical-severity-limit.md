# Enforce Critical Severity Limit  
**Type:** Rule  
**ID:** `gitlab-project-critical-severity-limit`  
**Uses:** `gitlab/project/critical-severity-limit@v2/rules`  
**Source:** [v2/rules/gitlab/project/critical-severity-limit.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/critical-severity-limit.yaml)  
**Rego Source:** [critical-severity-limit.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/critical-severity-limit.rego)  
**Labels:** Gitlab, Project  

Verify the maximum allowed critical severity alerts for the GitLab project.

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
max_allowed_vulnerability_count: 0
```

