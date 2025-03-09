# Rule: Check Description Substring

**ID**: `gitlab-project-description-substring-check`  
**Source YAML**: `description-substring-check.yaml`  
**Rego File Path**: `description-substring-check.rego`  

**Labels**: Gitlab, Project

**Short Description**: Verify a specific substring is not found in the description attribute of vulnerabilities for the GitLab project.

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
pattern: (?i)insdput
```
