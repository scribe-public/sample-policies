# Rule: Ensure All Commits Are Signed in GitLab Project

**ID**: `gitlab-project-signed-commits`  
**Source**: [v2/rules/gitlab/project/check-signed-commits.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/project/check-signed-commits.yaml)  
**Rego File Path**: `check-signed-commits.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify all commits in the GitLab project are signed.

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
