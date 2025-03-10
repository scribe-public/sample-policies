# Verify secret scanning.  
** Type:** Rule  
**ID:** `github-repo-validity-checks`  
**Uses:** `github/repository/validity-checks@v2/rules`  
**Source:** [v2/rules/github/repository/validity-checks.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/validity-checks.yaml)  
**Rego Source:** [validity-checks.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/validity-checks.rego)  
**Labels:** GitHub, Repository  

Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=repository', '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

