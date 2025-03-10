# Require Minimal Approvers in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-required-minimal-approvers`  
**Uses:** `gitlab/project/required-minimal-approvers@v2/rules`  
**Source:** [v2/rules/gitlab/project/required-minimal-approvers.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/required-minimal-approvers.yaml)  
**Rego Source:** [required-minimal-approvers.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/required-minimal-approvers.rego)  
**Labels:** Gitlab, Project  

Verify the required number of approvers for the GitLab project is met.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

