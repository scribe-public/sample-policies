# Rule: Verify All Commits Are Signed in Repository

**ID**: `github-repo-signed-commits`  
**Uses**: `github/repository/signed-commits@v2/rules  
**Source**: [v2/rules/github/repository/signed-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/signed-commits.yaml)  
**Rego Source**: [signed-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/signed-commits.rego)  
**Short Description**: Verify all commits are signed in a repository attestation.  
**Labels**: GitHub, Repository

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
