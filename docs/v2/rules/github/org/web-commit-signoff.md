# Rule: Verify GitHub Organization Requires Signoff on Web Commits  
**ID:** `github-org-web-commit-signoff`  
**Uses:** `github/org/web-commit-signoff@v2/rules`  
**Source:** [v2/rules/github/org/web-commit-signoff.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/web-commit-signoff.yaml)  
**Rego Source:** [web-commit-signoff.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/web-commit-signoff.rego)  
**Short Description:** Verify contributors sign commits through the GitHub web interface.  
**Labels:** GitHub, Organization  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

