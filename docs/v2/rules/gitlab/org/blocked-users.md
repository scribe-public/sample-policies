# Block Users in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-blocked-users`  
**Uses:** `gitlab/org/blocked-users@v2/rules`  
**Source:** [v2/rules/gitlab/org/blocked-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/blocked-users.yaml)  
**Rego Source:** [blocked-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/blocked-users.rego)  
**Labels:** Gitlab, Organization  

Verify no users in the GitLab organization are on the block list.

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
| blocked_users | [] |
