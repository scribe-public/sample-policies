# Rule: Allowed Public Repositories

**ID**: `github-repo-visibility`  
**Source**: [v2/rules/github/repository/visibility.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/visibility.yaml)  
**Rego File Path**: `visibility.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify only GitHub repositories in the Allowed List are public.

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
allowed_repo_names: []
```
