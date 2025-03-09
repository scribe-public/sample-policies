# Rule: Verify No Old Secrets Exist in Repository

**ID**: `github-repo-old-secrets`  
**Source YAML**: `old-secrets.yaml`  
**Rego File Path**: `old-secrets.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify secrets in the GitHub repository are not older than the specified threshold.

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
## Rule Parameters (`with`)

```yaml
max_secret_age: 12
```
