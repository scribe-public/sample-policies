# Allowed Committer Names in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-committer-names`  
**Uses:** `gitlab/project/committer-name-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/committer-name-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-name-check.yaml)  
**Rego Source:** [committer-name-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-name-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List commit by name in the GitLab project.

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
| allowed_committers | ['somename'] |
