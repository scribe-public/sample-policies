# Rule: Set Visibility Level in GitLab Project  
**ID:** `gitlab-project-project-visibility-level`  
**Uses:** `gitlab/project/visibility-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/visibility-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/visibility-check.yaml)  
**Rego Source:** [visibility-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/visibility-check.rego)  
**Short Description:** Verify the GitLab project's visibility matches the required level.  
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
visibility: private
```

