# Enable Commit Committer Check in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-commit_committer_check`  
**Uses:** `gitlab/project/commit-committer-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-committer-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-committer-check.yaml)  
**Rego Source:** [commit-committer-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-committer-check.rego)  
**Labels:** Gitlab, Project  

Verify `commit_committer_check` is enabled for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

