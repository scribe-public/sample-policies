# Rule: Allowed Users in GitLab Organization  
**ID:** `gitlab-org-allowed-users`  
**Uses:** `gitlab/org/allow-users@v2/rules`  
**Source:** [v2/rules/gitlab/org/allow-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-users.yaml)  
**Rego Source:** [allow-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/allow-users.rego)  
**Short Description:** Verify only users in the Allowed List have access to the GitLab organization.  
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
allowed_users: []
```

