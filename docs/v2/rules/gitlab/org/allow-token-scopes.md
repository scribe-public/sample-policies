# Restrict Token Scopes in GitLab  
**Type:** Rule  
**ID:** `gitlab-org-allowed-token-scope`  
**Uses:** `gitlab/org/allow-token-scopes@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-token-scopes.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-token-scopes.yaml)  
**Rego Source:** [allow-token-scopes.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-token-scopes.rego)  
**Labels:** Gitlab, Organization  

Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=organization |

## Rule Parameters (`with`)  
```yaml
allowed_token_scopes:
- api
- read_api
- read_repository
- read_registry
```

