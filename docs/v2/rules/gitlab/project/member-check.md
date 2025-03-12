# Enable Member Check for GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-member_check`  
**Uses:** `gitlab/project/member-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/member-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/member-check.yaml)  
**Rego Source:** [member-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/member-check.rego)  
**Labels:** Gitlab, Project  

Verify `member_check` is enabled for the GitLab project.

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

