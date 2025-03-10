# Merge approval policy check for GitLab project  
**Type:** Rule  
**ID:** `gitlab-project-merge-approval`  
**Uses:** `gitlab/project/approvals-policy-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/approvals-policy-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvals-policy-check.yaml)  
**Rego Source:** [approvals-policy-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvals-policy-check.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify the project's merge approval policy complies with requirements.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

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
| name | All Members |
| approvals_required_min | 2 |
