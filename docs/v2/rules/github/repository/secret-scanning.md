# Rule: Verify secret_scanning setting  
**ID:** `github-repo-secret-scanning`  
**Uses:** `github/repository/secret-scanning@v2/rules`  
**Source:** [v2/rules/github/repository/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/secret-scanning.yaml)  
**Rego Source:** [secret-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/secret-scanning.rego)  
**Short Description:** Verify `secret_scanning` is configured in the GitHub repository.  
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

