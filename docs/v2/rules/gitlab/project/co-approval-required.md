# Require Code Owner Approval in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-code-owner-approval`  
**Uses:** `gitlab/project/co-approval-required@v2/rules`  
**Source:** [v2/rules/gitlab/project/co-approval-required.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/co-approval-required.yaml)  
**Rego Source:** [co-approval-required.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/co-approval-required.rego)  
**Labels:** Gitlab, Project  

Verify code owner approval is required for specific branches in the GitLab project.

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
| branch | main |
