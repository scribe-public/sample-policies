# Ensure Secrets Scanning Passes  
**Type:** Rule  
**ID:** `gitlab-project-secrets-scan-pass`  
**Uses:** `gitlab/project/secrets-scan-pass@v2/rules`  
**Source:** [v2/rules/gitlab/project/secrets-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.yaml)  
**Rego Source:** [secrets-scan-pass.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.rego)  
**Labels:** Gitlab, Project  

Verify secrets scanning is successful for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

