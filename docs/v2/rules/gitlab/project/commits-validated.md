# Validate All Commits in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-all-commits-validated`  
**Uses:** `gitlab/project/commits-validated@v2/rules`  
**Source:** [v2/rules/gitlab/project/commits-validated.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commits-validated.yaml)  
**Rego Source:** [commits-validated.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commits-validated.rego)  
**Labels:** Gitlab, Project  

Verify all commits in the GitLab project are validated.

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

