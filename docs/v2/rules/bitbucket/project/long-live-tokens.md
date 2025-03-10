# Prevent Long-Lived Tokens  
** Type:** Rule  
**ID:** `bb-project-long-live-tokens`  
**Uses:** `bitbucket/project/long-live-tokens@v2/rules`  
**Source:** [v2/rules/bitbucket/project/long-live-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/long-live-tokens.yaml)  
**Rego Source:** [long-live-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/long-live-tokens.rego)  
**Labels:** Bitbucket, Project  

Verify Bitbucket API tokens expire before the maximum time to live.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=project', 'platform=bitbucket', 'platform_instance=bitbucket_dc'] |

## Rule Parameters (`with`)  
```yaml
max_days: 30
```

