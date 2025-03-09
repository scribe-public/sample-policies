# Rule: Verify No Organization Secrets Exist in Repository

**ID**: `github-repo-no-org-secrets`  
**Source YAML**: `no-org-secrets.yaml`  
**Rego File Path**: `no-org-secrets.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify no organization secrets exist in the GitHub repository.

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
