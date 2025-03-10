# Rule: Merge approval policy check for GitLab project  
**ID:** `gitlab-project-merge-approval`  
**Uses:** `gitlab/project/approvals-policy-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/approvals-policy-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvals-policy-check.yaml)  
**Rego Source:** [approvals-policy-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/approvals-policy-check.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify the project's merge approval policy complies with requirements.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=gitlab', 'asset_type=project', '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
name: All Members
approvals_required_min: 2
```

