# Verify Branch Verification Setting  
**Type:** Rule  
**ID:** `github-repo-branch-verification`  
**Uses:** `github/repository/branch-verification@v2/rules`  
**Source:** [v2/rules/github/repository/branch-verification.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-verification.yaml)  
**Rego Source:** [branch-verification.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/branch-verification.rego)  
**Labels:** GitHub, Repository  

Verify branch verification in the GitHub repository matches the value defined in the configuration file.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br>- asset_type=repository |

## Rule Parameters (`with`)  
```yaml
desired_verified: false
```

