# Rule: Verify Branch Protection Setting

**ID**: `github-repo-branch-protection`  
**Source**: [v2/rules/github/repository/branch-protection.yaml](scribe-public/sample-policies.git/v2/rules/github/repository/branch-protection.yaml)  
**Rego File Path**: `branch-protection.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify branch protection is configured in the GitHub repository.

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
desired_protected: true
branches:
- main
- master
```
