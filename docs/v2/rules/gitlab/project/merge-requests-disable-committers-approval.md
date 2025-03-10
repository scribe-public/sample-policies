# Disable Committers' Approval for Merge Requests in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-merge-requests-disable-committers-approval`  
**Uses:** `gitlab/project/merge-requests-disable-committers-approval@v2/rules`  
**Source:** [v2/rules/gitlab/project/merge-requests-disable-committers-approval.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-requests-disable-committers-approval.yaml)  
**Rego Source:** [merge-requests-disable-committers-approval.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-requests-disable-committers-approval.rego)  
**Labels:** Gitlab, Project  

Verify `merge_requests_disable_committers_approval` is set for the GitLab project.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| merge_requests_disable_committers_approval | False |
