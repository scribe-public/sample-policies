# Disable Author Approval for Merge Requests in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-merge-requests-author-approval`  
**Uses:** `gitlab/project/merge-requests-author-approval@v2/rules`  
**Source:** [v2/rules/gitlab/project/merge-requests-author-approval.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-requests-author-approval.yaml)  
**Rego Source:** [merge-requests-author-approval.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/merge-requests-author-approval.rego)  
**Labels:** Gitlab, Project  

Verify the binary field `merge_requests_author_approval` is set for the GitLab project.

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
merge_requests_author_approval: true
```

