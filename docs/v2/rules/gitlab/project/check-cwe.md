# Rule: Check CWE Compliance  
**ID:** `gitlab-project-check-cwe`  
**Uses:** `gitlab/project/check-cwe@v2/rules`  
**Source:** [v2/rules/gitlab/project/check-cwe.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-cwe.yaml)  
**Rego Source:** [check-cwe.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-cwe.rego)  
**Short Description:** Verify that specified CWEs were not detected in the GitLab project.  
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
cwe_value: '89'
```

