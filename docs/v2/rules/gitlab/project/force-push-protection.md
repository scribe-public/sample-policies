# Rule: Disallow Force Push in GitLab Project

**ID**: `gitlab-project-disallow-force-push`  
**Uses**: `gitlab/project/force-push-protection@v2/rules  
**Source**: [v2/rules/gitlab/project/force-push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/force-push-protection.yaml)  
**Rego Source**: [force-push-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/force-push-protection.rego)  
**Short Description**: Verify force pushes in the GitLab project are disallowed to maintain repository integrity.  
**Labels**: Gitlab, Project

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
