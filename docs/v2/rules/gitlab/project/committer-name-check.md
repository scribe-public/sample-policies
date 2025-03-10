# Rule: Allowed Committer Names in GitLab Project  
**ID:** `gitlab-project-allowed-committer-names`  
**Uses:** `gitlab/project/committer-name-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/committer-name-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-name-check.yaml)  
**Rego Source:** [committer-name-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/committer-name-check.rego)  
**Short Description:** Verify only users in the Allowed List commit by name in the GitLab project.  
**Labels:** Gitlab, Project  
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
allowed_committers:
- somename
```

