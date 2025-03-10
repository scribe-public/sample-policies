# Rule: Allowed Project Users  
**ID:** `bb-project-allowed-project-users`  
**Uses:** `bitbucket/project/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/project/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-users.rego)  
**Short Description:** Verify only users specified in the Allowed List have user access to the Bitbucket project.  
> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=bitbucket', 'asset_type=project'] |

## Rule Parameters (`with`)  
```yaml
allowed_users: []
```

