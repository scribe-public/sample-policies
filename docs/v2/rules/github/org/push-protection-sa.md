# Rule: Verify Secret_Scanning_Push_Protection Setting  
**ID:** `github-org-push-protection-sa`  
**Uses:** `github/org/push-protection-sa@v2/rules`  
**Source:** [v2/rules/github/org/push-protection-sa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection-sa.yaml)  
**Rego Source:** [push-protection-sa.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/push-protection-sa.rego)  
**Short Description:** Verify `secret_scanning_push_protection` is configured in the GitHub repository.  
**Labels:** GitHub, Organization  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

