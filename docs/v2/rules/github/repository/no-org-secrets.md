# Verify No Organization Secrets Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-no-org-secrets`  
**Uses:** `github/repository/no-org-secrets@v2/rules`  
**Source:** [v2/rules/github/repository/no-org-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-org-secrets.yaml)  
**Rego Source:** [no-org-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/no-org-secrets.rego)  
**Labels:** GitHub, Repository  

Verify no organization secrets exist in the GitHub repository.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br>- asset_type=repository |

