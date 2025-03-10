# Rule: Protect CI Secrets in GitLab Project

**ID**: `gitlab-project-protect-ci-secrets`
**Source**: [v2/rules/gitlab/project/protect-ci-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/protect-ci-secrets.yaml)
**Uses**: `gitlab/project/protect-ci-secrets@v2/rules
**Rego File Path**: `protect-ci-secrets.rego`

**Labels**: Gitlab, Project

**Short Description**: Verify secrets in the GitLab project are not shared.

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
pattern: (?i)(token|secret)
```
