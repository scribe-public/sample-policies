# Rule: Ensure All Commits Are Signed in GitLab Project  
**ID:** `gitlab-project-signed-commits`  
**Uses:** `gitlab/project/check-signed-commits@v2/rules`  
**Source:** [v2/rules/gitlab/project/check-signed-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-signed-commits.yaml)  
**Rego Source:** [check-signed-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-signed-commits.rego)  
**Short Description:** Verify all commits in the GitLab project are signed.  
**Labels:** Gitlab, Project  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

