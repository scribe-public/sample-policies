# Restrict Approvers Per Merge Request  
**Type:** Rule  
**ID:** `gitlab-project-approvers-per-merge-request`  
**Uses:** `gitlab/project/approvers-per-merge-request@v2/rules`  
**Source:** [v2/rules/gitlab/project/approvers-per-merge-request.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvers-per-merge-request.yaml)  
**Rego Source:** [approvers-per-merge-request.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvers-per-merge-request.rego)  
**Labels:** Gitlab, Project  

Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project.

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
```yaml
disable_overriding_approvers_per_merge_request: false
```

