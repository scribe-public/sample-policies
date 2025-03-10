# Rule: Verify Inactive Users  
**ID:** `jenkins-inactive-users`  
**Uses:** `jenkins/instance/inactive-users@v2/rules`  
**Source:** [v2/rules/jenkins/instance/inactive-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/inactive-users.yaml)  
**Rego Source:** [inactive-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/instance/inactive-users.rego)  
**Short Description:** Verify there are no inactive users.  
**Labels:** Jenkins, Instance  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=instance', 'platform=jenkins'] |

## Rule Parameters (`with`)  
```yaml
inactive_for_days: 90
```

