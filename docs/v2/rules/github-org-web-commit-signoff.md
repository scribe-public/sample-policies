# Rule: Verify GitHub Organization Requires Signoff on Web Commits

**ID**: `github-org-web-commit-signoff`  
**Source YAML**: `web-commit-signoff.yaml`  
**Rego File Path**: `web-commit-signoff.rego`  

**Labels**: GitHub, Organization

**Short Description**: Verify contributors sign commits through the GitHub web interface.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
