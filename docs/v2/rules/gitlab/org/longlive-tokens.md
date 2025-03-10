# Rule: Forbid Long-Lived Tokens in GitLab Organization  
**ID:** `gitlab-org-token-excessive-lifespan`  
**Uses:** `gitlab/org/longlive-tokens@v2/rules`  
**Source:** [v2/rules/gitlab/org/longlive-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.yaml)  
**Rego Source:** [longlive-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/longlive-tokens.rego)  
**Short Description:** Verify no GitLab organization tokens have an excessively long lifespan.  
**Labels:** Blueprint, Gitlab, Organization  
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
exiring_in_days: 365
```

