# Verify Inactive Users  
**Type:** Rule  
**ID:** `jenkins-inactive-users`  
**Uses:** `jenkins/instance/inactive-users@v2/rules`  
**Source:** [v2/rules/jenkins/instance/inactive-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/inactive-users.yaml)  
**Rego Source:** [inactive-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/inactive-users.rego)  
**Labels:** Jenkins, Instance  

Verify there are no inactive users.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=instance<br>- platform=jenkins |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| inactive_for_days | 90 |
