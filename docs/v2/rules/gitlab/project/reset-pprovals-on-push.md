# Rule: Reset Approvals on Push in GitLab Project  
**ID:** `gitlab-project-reset-pprovals-on-push`  
**Uses:** `gitlab/project/reset-pprovals-on-push@v2/rules`  
**Source:** [v2/rules/gitlab/project/reset-pprovals-on-push.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reset-pprovals-on-push.yaml)  
**Rego Source:** [reset-pprovals-on-push.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reset-pprovals-on-push.rego)  
**Short Description:** Verify `reset_approvals_on_push` is set for the GitLab project.  
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
reset_approvals_on_push: true
```

