# Verify Project Activity  
**Type:** Rule  
**ID:** `gitlab-project-abandoned-project`  
**Uses:** `gitlab/project/abandoned-project@v2/rules`  
**Source:** [v2/rules/gitlab/project/abandoned-project.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/abandoned-project.yaml)  
**Rego Source:** [abandoned-project.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/abandoned-project.rego)  
**Labels:** Gitlab, Project  

Verify the GitLab project is active for a specified duration.

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
| inactive_for_days | 30 |
