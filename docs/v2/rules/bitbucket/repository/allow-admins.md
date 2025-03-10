# Allowed Repository Admins  
**Type:** Rule  
**ID:** `bb-repo-allowed-repository-admins`  
**Uses:** `bitbucket/repository/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/repository/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-admins.rego)  
**Labels:** Bitbucket, Repository  

Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=bitbucket', 'asset_type=repository'] |

## Rule Parameters (`with`)  
```yaml
allowed_admins: []
```

