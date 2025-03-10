# Rule: Set Push Rules for GitLab Project  
**ID:** `gitlab-project-verify-push_rules`  
**Uses:** `gitlab/project/push-rules-set@v2/rules`  
**Source:** [v2/rules/gitlab/project/push-rules-set.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-rules-set.yaml)  
**Rego Source:** [push-rules-set.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/push-rules-set.rego)  
**Short Description:** Verify push rules are set for the GitLab project.  
**Labels:** Gitlab, Project  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

