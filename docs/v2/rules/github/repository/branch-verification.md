# Rule: Verify Branch Verification Setting

**ID**: `github-repo-branch-verification`  
**Source**: [v2/rules/github/repository/branch-verification.yaml](scribe-public/sample-policies.git/v2/rules/github/repository/branch-verification.yaml)  
**Rego File Path**: `branch-verification.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify branch verification in the GitHub repository matches the value defined in the configuration file.

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
desired_verified: false
```
