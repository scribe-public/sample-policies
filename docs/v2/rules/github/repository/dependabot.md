# Rule: Verify Dependabot security updates setting

**ID**: `github-repo-dependabot`  
**Source**: [v2/rules/github/repository/dependabot.yaml](scribe-public/sample-policies.git/v2/rules/github/repository/dependabot.yaml)  
**Rego File Path**: `dependabot.rego`  

**Labels**: GitHub, Repository

**Short Description**: Verify Dependabot security updates are configured in the GitHub repository.

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
