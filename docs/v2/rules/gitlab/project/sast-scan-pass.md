# Ensure SAST Scanning Passes  
** Type:** Rule  
**ID:** `gitlab-project-sast-scan-pass`  
**Uses:** `gitlab/project/sast-scan-pass@v2/rules`  
**Source:** [v2/rules/gitlab/project/sast-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/sast-scan-pass.yaml)  
**Rego Source:** [sast-scan-pass.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/sast-scan-pass.rego)  
**Labels:** Gitlab, Project  

Verify SAST scanning is successful for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

