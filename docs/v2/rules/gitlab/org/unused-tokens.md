# Forbid Unused Tokens in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-unused-tokens`  
**Uses:** `gitlab/org/unused-tokens@v2/rules`  
**Source:** [v2/rules/gitlab/org/unused-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/unused-tokens.yaml)  
**Rego Source:** [unused-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/unused-tokens.rego)  
**Labels:** Gitlab, Organization  

Verify there are no unused GitLab organization tokens.

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
| unused_for_days | 90 |
