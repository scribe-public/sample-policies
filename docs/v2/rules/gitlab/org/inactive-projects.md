# Rule: Ensure Active Projects in GitLab Organization  
**ID:** `gitlab-org-inactive-projects`  
**Uses:** `gitlab/org/inactive-projects@v2/rules`  
**Source:** [v2/rules/gitlab/org/inactive-projects.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/inactive-projects.yaml)  
**Rego Source:** [inactive-projects.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/inactive-projects.rego)  
**Short Description:** Verify no GitLab organization projects are inactive.  
**Labels:** Gitlab, Organization  
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
inactive_for_days: 90
```

