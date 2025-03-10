# Disallow Banned Approvers  
**Type:** Rule  
**ID:** `gitlab-project-disallowed-banned-approvers`  
**Uses:** `gitlab/project/disallowed-banned-approvers@v2/rules`  
**Source:** [v2/rules/gitlab/project/disallowed-banned-approvers.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/disallowed-banned-approvers.yaml)  
**Rego Source:** [disallowed-banned-approvers.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/disallowed-banned-approvers.rego)  
**Labels:** Gitlab, Project  

Verify approvers in the GitLab project are not on the banned list.

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
banned_list: []
```

