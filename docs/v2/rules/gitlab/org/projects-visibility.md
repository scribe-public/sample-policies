# Restrict Public Visibility in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-visible-projects`  
**Uses:** `gitlab/org/projects-visibility@v2/rules`  
**Source:** [v2/rules/gitlab/org/projects-visibility.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/projects-visibility.yaml)  
**Rego Source:** [projects-visibility.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/projects-visibility.rego)  
**Labels:** Gitlab, Organization  

Verify only allowed projects in the GitLab organization have public visibility.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_public | ['Learn GitLab', 'Scribe Gitlab Test'] |
