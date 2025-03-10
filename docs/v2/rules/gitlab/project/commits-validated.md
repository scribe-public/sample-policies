# Rule: Validate All Commits in GitLab Project

**ID**: `gitlab-project-all-commits-validated`
**Source**: [v2/rules/gitlab/project/commits-validated.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commits-validated.yaml)
**Uses**: `gitlab/project/commits-validated@v2/rules
**Rego Source**: [commits-validated.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commits-validated.rego)

**Labels**: Gitlab, Project

**Short Description**: Verify all commits in the GitLab project are validated.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=gitlab
- asset_type=project
- '{{- if eq (index .Context "asset-type") "project" -}} {{- asset_on_target (index
  .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'
```
