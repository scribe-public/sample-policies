# Rule: Allowed Workspace Admins  
**ID:** `bb-workspace-allowed-workspace-admins`  
**Uses:** `bitbucket/workspace/allow-admins@v2/rules`  
**Source:** [v2/rules/bitbucket/workspace/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/workspace/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/workspace/allow-admins.rego)  
**Short Description:** Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace.  
**Labels:** Bitbucket, Workspace  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=bitbucket', 'asset_type=workspace'] |

## Rule Parameters (`with`)  
```yaml
allowed_admins: []
```

