# Allowed Users in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-users`  
**Uses:** `gitlab/org/allow-users@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-users.rego)  
**Labels:** Gitlab, Organization  

Verify only users in the Allowed List have access to the GitLab organization.

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
| allowed_users | [] |
