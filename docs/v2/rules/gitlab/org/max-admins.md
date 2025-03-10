# Limit Admins in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-max-admins`  
**Uses:** `gitlab/org/max-admins@v2/rules`  
**Source:** [v2/rules/gitlab/org/max-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/max-admins.yaml)  
**Rego Source:** [max-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/max-admins.rego)  
**Labels:** Blueprint, GitLab, Organization  

Verify the maximum number of admins for the GitLab project is restricted.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

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
| max_admins | 0 |
