# Rule: Reject Unsigned Commits in GitLab Project

**ID**: `gitlab-project-disallow-unsigned-commits`  
**Source YAML**: `reject-unsigned-commits.yaml`  
**Rego File Path**: `reject-unsigned-commits.rego`  

**Labels**: Blueprint, Gitlab, Project

**Short Description**: Verify `reject_unsigned_commits` is enabled for the GitLab project.

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
