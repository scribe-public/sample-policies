# Allowed Committer Emails in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-committer-emails`  
**Uses:** `gitlab/project/committer-email-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/committer-email-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-email-check.yaml)  
**Rego Source:** [committer-email-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List use committer email addresses in the GitLab project.

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
| allowed_committers | ['mail@example.com'] |
