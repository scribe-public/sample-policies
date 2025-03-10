# Rule: Verify Push Protection Setting  
**ID:** `github-repo-push-protection`  
**Uses:** `github/repository/push-protection@v2/rules`  
**Source:** [v2/rules/github/repository/push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/push-protection.yaml)  
**Rego Source:** [push-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/push-protection.rego)  
**Short Description:** Verify `secret_scanning_push_protection` is configured in the GitHub repository.  
**Labels:** GitHub, Repository  
> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=repository', '{{- if eq (index .Context "asset-type") "repository" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

