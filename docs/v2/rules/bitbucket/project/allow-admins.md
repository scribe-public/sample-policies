# Rule: Allowed Project Admins  
**ID:** `bb-project-allowed-project-admins`  
**Uses:** `bitbucket/project/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/project/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/allow-admins.rego)  
**Short Description:** Verify only users specified in the Allowed List have admin privileges in the Bitbucket project.  
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
allowed_admins: []
```

