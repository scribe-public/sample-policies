# Enforce Critical Severity Limit  
**Type:** Rule  
**ID:** `gitlab-project-critical-severity-limit`  
**Uses:** `gitlab/project/critical-severity-limit@v2/rules`  
**Source:** [v2/rules/gitlab/project/critical-severity-limit.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/critical-severity-limit.yaml)  
**Rego Source:** [critical-severity-limit.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/critical-severity-limit.rego)  
**Labels:** Gitlab, Project  

Verify the maximum allowed critical severity alerts for the GitLab project.

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
| labels | - platform=gitlab<br>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_allowed_vulnerability_count | 0 |
