# Rule: Enforce Merge Access Level Policy for GitLab Project  
**ID:** `gitlab-project-merge-access-level`  
**Uses:** `gitlab/project/merge-access-level@v2/rules`  
**Source:** [v2/rules/gitlab/project/merge-access-level.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-access-level.yaml)  
**Rego Source:** [merge-access-level.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-access-level.rego)  
**Short Description:** Verify the GitLab project's merge access level complies with requirements.  
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
branch: main
access_level_description: Maintainers
```

