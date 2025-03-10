# Verify All Commits Are Signed in Repository  
**Type:** Rule  
**ID:** `github-repo-signed-commits`  
**Uses:** `github/repository/signed-commits@v2/rules`  
**Source:** [v2/rules/github/repository/signed-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/signed-commits.yaml)  
**Rego Source:** [signed-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/signed-commits.rego)  
**Labels:** GitHub, Repository  

Verify all commits are signed in a repository attestation.

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

