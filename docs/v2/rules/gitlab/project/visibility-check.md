# Set Visibility Level in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-project-visibility-level`  
**Uses:** `gitlab/project/visibility-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/visibility-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/visibility-check.yaml)  
**Rego Source:** [visibility-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/visibility-check.rego)  
**Labels:** Gitlab, Project  

Verify the GitLab project's visibility matches the required level.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

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
| visibility | private |
