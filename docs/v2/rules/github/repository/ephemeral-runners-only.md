# Verify Only Ephemeral Runners Exist in Repository  
**Type:** Rule  
**ID:** `github-repo-ephemeral-runners-only`  
**Uses:** `github/repository/ephemeral-runners-only@v2/rules`  
**Source:** [v2/rules/github/repository/ephemeral-runners-only.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/ephemeral-runners-only.yaml)  
**Rego Source:** [ephemeral-runners-only.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/ephemeral-runners-only.rego)  
**Labels:** GitHub, Repository  

Verify self-hosted runners are disallowed in the GitHub repository.

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

