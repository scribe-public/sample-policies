# Rule: Verify Repository Requires Commit Signoff  
**ID:** `github-repo-web-commit-signoff`  
**Uses:** `github/repository/web-commit-signoff@v2/rules`  
**Source:** [v2/rules/github/repository/web-commit-signoff.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/web-commit-signoff.yaml)  
**Rego Source:** [web-commit-signoff.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/web-commit-signoff.rego)  
**Short Description:** Verify contributors sign off on commits to the GitHub repository through the GitHub web interface.  
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

