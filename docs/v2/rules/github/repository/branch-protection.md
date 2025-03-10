# Rule: Verify Branch Protection Setting  
**ID:** `github-repo-branch-protection`  
**Uses:** `github/repository/branch-protection@v2/rules`  
**Source:** [v2/rules/github/repository/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-protection.rego)  
**Short Description:** Verify branch protection is configured in the GitHub repository.  
**Labels:** GitHub, Repository  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=repository', '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
desired_protected: true
branches:
- main
- master
```

