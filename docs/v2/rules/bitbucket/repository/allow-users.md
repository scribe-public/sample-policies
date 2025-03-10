# Allowed Repository Users  
** Type:** Rule  
**ID:** `bb-repo-allowed-repository-users`  
**Uses:** `bitbucket/repository/allow-users@v2/rules`  
**Source:** [v2/rules/bitbucket/repository/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/repository/allow-users.rego)  
**Labels:** Bitbucket, Repository  

Verify only users specified in the Allowed List have user access to the Bitbucket repository.

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
allowed_users: []
```

