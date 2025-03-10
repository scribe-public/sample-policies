# Rule: Allowed Admins in GitLab Organization  
**ID:** `gitlab-org-allowed-admins`  
**Uses:** `gitlab/org/allow-admins@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-admins.yaml)  
**Rego Source:** [allow-admins.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-admins.rego)  
**Labels:** Gitlab, Organization  

Verify only users in the Allowed List have admin privileges in the GitLab organization.

> Evidence for this rule **IS NOT** required by default but is recommended.


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
allowed_admins: []
```

