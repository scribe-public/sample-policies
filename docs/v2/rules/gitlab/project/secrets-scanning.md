# Run Secrets Scanning in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-secrets-scanning`  
**Uses:** `gitlab/project/secrets-scanning@v2/rules`  
**Source:** [v2/rules/gitlab/project/secrets-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scanning.yaml)  
**Rego Source:** [secrets-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scanning.rego)  
**Labels:** Gitlab, Project  

Verify secrets scanning is performed for the GitLab project.

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

