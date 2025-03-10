# Rule: Verify No Old Secrets Exist in Repository  
**ID:** `github-repo-old-secrets`  
**Uses:** `github/repository/old-secrets@v2/rules`  
**Source:** [v2/rules/github/repository/old-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/old-secrets.rego)  
**Short Description:** Verify secrets in the GitHub repository are not older than the specified threshold.  
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

## Rule Parameters (`with`)  
```yaml
max_secret_age: 12
```

