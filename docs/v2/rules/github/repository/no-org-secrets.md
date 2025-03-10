# Rule: Verify No Organization Secrets Exist in Repository  
**ID:** `github-repo-no-org-secrets`  
**Uses:** `github/repository/no-org-secrets@v2/rules`  
**Source:** [v2/rules/github/repository/no-org-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-org-secrets.yaml)  
**Rego Source:** [no-org-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-org-secrets.rego)  
**Labels:** GitHub, Repository  

Verify no organization secrets exist in the GitHub repository.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=repository', '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

