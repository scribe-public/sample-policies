# Forbid Long-Lived Tokens in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-token-excessive-lifespan`  
**Uses:** `gitlab/org/longlive-tokens@v2/rules`  
**Source:** [v2/rules/gitlab/org/longlive-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.yaml)  
**Rego Source:** [longlive-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.rego)  
**Labels:** Blueprint, Gitlab, Organization  

Verify no GitLab organization tokens have an excessively long lifespan.

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
| exiring_in_days | 365 |
