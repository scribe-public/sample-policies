# Rule: Enable Secrets Prevention in GitLab Project  
**ID:** `gitlab-project-verify-prevent_secrets`  
**Uses:** `gitlab/project/prevent-secrets-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/prevent-secrets-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/prevent-secrets-check.yaml)  
**Rego Source:** [prevent-secrets-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/prevent-secrets-check.rego)  
**Labels:** Gitlab, Project  

Verify `prevent_secrets` is enabled for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

