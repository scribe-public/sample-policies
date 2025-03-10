# Rule: Disallow Force Push in GitLab Project

**ID**: `gitlab-project-disallow-force-push`  
**Source**: [v2/rules/gitlab/project/force-push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/force-push-protection.yaml)  
**Rego File Path**: `force-push-protection.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify force pushes in the GitLab project are disallowed to maintain repository integrity.

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
branch: main
```
