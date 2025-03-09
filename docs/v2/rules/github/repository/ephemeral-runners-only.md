# Rule: Verify Only Ephemeral Runners Exist in Repository

**ID**: `github-repo-ephemeral-runners-only`  
**Source YAML**: `ephemeral-runners-only.yaml`  
**Rego File Path**: `ephemeral-runners-only.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify self-hosted runners are disallowed in the GitHub repository.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=repository
- '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index
  .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'
```
