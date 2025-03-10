# Rule: Enforce Medium Severity Limit  
**ID:** `gitlab-project-medium-severity-limit`  
**Uses:** `gitlab/project/medium-severity-limit@v2/rules`  
**Source:** [v2/rules/gitlab/project/medium-severity-limit.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/medium-severity-limit.yaml)  
**Rego Source:** [medium-severity-limit.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/medium-severity-limit.rego)  
**Short Description:** Verify the maximum allowed medium severity alerts for the GitLab project.  
**Labels:** Gitlab, Project  
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
max_allowed_specific_severity: 0
```

