# Reject Unsigned Commits in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-disallow-unsigned-commits`  
**Uses:** `gitlab/project/reject-unsigned-commits@v2/rules`  
**Source:** [v2/rules/gitlab/project/reject-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reject-unsigned-commits.yaml)  
**Rego Source:** [reject-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/reject-unsigned-commits.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify `reject_unsigned_commits` is enabled for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

