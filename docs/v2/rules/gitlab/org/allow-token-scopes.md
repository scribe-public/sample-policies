# Rule: Restrict Token Scopes in GitLab  
**ID:** `gitlab-org-allowed-token-scope`  
**Uses:** `gitlab/org/allow-token-scopes@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-token-scopes.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-token-scopes.yaml)  
**Rego Source:** [allow-token-scopes.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-token-scopes.rego)  
**Short Description:** Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission.  
**Labels:** Gitlab, Organization  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
allowed_token_scopes:
- api
- read_api
- read_repository
- read_registry
```

