# Rule: Prevent Token Expiration in GitLab Organization  
**ID:** `gitlab-org-token-about-to-expire`  
**Uses:** `gitlab/org/expiring-tokens@v2/rules`  
**Source:** [v2/rules/gitlab/org/expiring-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/expiring-tokens.yaml)  
**Rego Source:** [expiring-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/expiring-tokens.rego)  
**Short Description:** Verify no GitLab organization tokens are about to expire.  
**Labels:** Gitlab, Organization  
> Evidence for this rule **IS NOT** required by default but is recommended


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
exiring_in_days: 30
```

