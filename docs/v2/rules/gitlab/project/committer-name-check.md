# Rule: Allowed Committer Names in GitLab Project

**ID**: `gitlab-project-allowed-committer-names`  
**Source**: [v2/rules/gitlab/project/committer-name-check.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/committer-name-check.yaml)  
**Rego File Path**: `committer-name-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify only users in the Allowed List commit by name in the GitLab project.

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
allowed_committers:
- somename
```
