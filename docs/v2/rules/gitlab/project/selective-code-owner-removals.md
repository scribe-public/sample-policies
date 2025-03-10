# Restrict Selective Code Owner Removals in GitLab  
** Type:** Rule  
**ID:** `gitlab-project-selective-code-owner-removals`  
**Uses:** `gitlab/project/selective-code-owner-removals@v2/rules`  
**Source:** [v2/rules/gitlab/project/selective-code-owner-removals.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/selective-code-owner-removals.yaml)  
**Rego Source:** [selective-code-owner-removals.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/selective-code-owner-removals.rego)  
**Labels:** Gitlab, Project  

Verify `selective_code_owner_removals` is set for the GitLab project.

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
selective_code_owner_removals: true
```

