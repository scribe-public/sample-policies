# Rule: Verify Secret_Scanning Setting in Security_And_Analysis  
**ID:** `github-org-secret-scanning-sa`  
**Uses:** `github/org/secret-scanning-sa@v2/rules`  
**Source:** [v2/rules/github/org/secret-scanning-sa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning-sa.yaml)  
**Rego Source:** [secret-scanning-sa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/secret-scanning-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning` is configured in the GitHub repository.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

