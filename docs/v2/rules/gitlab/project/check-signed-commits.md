# Ensure All Commits Are Signed in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-signed-commits`  
**Uses:** `gitlab/project/check-signed-commits@v2/rules`  
**Source:** [v2/rules/gitlab/project/check-signed-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-signed-commits.yaml)  
**Rego Source:** [check-signed-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/check-signed-commits.rego)  
**Labels:** Gitlab, Project  

Verify all commits in the GitLab project are signed.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

