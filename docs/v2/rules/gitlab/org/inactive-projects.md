# Ensure Active Projects in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-inactive-projects`  
**Uses:** `gitlab/org/inactive-projects@v2/rules`  
**Source:** [v2/rules/gitlab/org/inactive-projects.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/inactive-projects.yaml)  
**Rego Source:** [inactive-projects.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/inactive-projects.rego)  
**Labels:** Gitlab, Organization  

Verify no GitLab organization projects are inactive.

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
| inactive_for_days | 90 |
