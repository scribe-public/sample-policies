# Rule: Ensure Secrets Scanning Passes  
**ID:** `gitlab-project-secrets-scan-pass`  
**Uses:** `gitlab/project/secrets-scan-pass@v2/rules`  
**Source:** [v2/rules/gitlab/project/secrets-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.yaml)  
**Rego Source:** [secrets-scan-pass.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.rego)  
**Short Description:** Verify secrets scanning is successful for the GitLab project.  
**Labels:** Gitlab, Project  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

