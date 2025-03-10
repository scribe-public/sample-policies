# Rule: Disallow Unused Users  
**ID:** `jenkins-unused-users`  
**Uses:** `jenkins/instance/unused-users@v2/rules`  
**Source:** [v2/rules/jenkins/instance/unused-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.yaml)  
**Rego Source:** [unused-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/unused-users.rego)  
**Short Description:** Verify there are no users with zero activity.  
**Labels:** Jenkins, Instance  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=instance', 'platform=jenkins'] |

