# Rule: Allowed Commit Authors in GitLab Project

**ID**: `gitlab-project-allowed-commit-author-names`
**Source**: [v2/rules/gitlab/project/commit-author-name-check.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-name-check.yaml)
**Uses**: `gitlab/project/commit-author-name-check@v2/rules
**Rego Source**: [commit-author-name-check.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/commit-author-name-check.rego)

**Labels**: Gitlab, Project

**Short Description**: Verify only users in the Allowed List author commits in the GitLab project.

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
## Rule Parameters (`with`)

```yaml
allowed_authors:
- examplename
```
