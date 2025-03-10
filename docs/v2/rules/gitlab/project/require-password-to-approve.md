# Require Password for Approvals in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-require-password-to-approve`  
**Uses:** `gitlab/project/require-password-to-approve@v2/rules`  
**Source:** [v2/rules/gitlab/project/require-password-to-approve.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/require-password-to-approve.yaml)  
**Rego Source:** [require-password-to-approve.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/require-password-to-approve.rego)  
**Labels:** Gitlab, Project  

Verify the binary field `require_password_to_approve` is set for the GitLab project.

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
| require_password_to_approve | True |
