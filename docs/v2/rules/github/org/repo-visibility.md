# Rule: Verify Repo Visibility Setting

**ID**: `github-org-repo-visibility`  
**Uses**: `github/org/repo-visibility@v2/rules  
**Source**: [v2/rules/github/org/repo-visibility.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/repo-visibility.yaml)  
**Rego Source**: [repo-visibility.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/repo-visibility.rego)  
**Short Description**: Verify only repositories in the Allowed List are public in the GitHub organization.  
**Labels**: GitHub, Organization

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
## Rule Parameters (`with`)

```yaml
allowed_repo_names: []
```
