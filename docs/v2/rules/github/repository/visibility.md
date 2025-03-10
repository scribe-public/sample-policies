# Allowed Public Repositories  
**Type:** Rule  
**ID:** `github-repo-visibility`  
**Uses:** `github/repository/visibility@v2/rules`  
**Source:** [v2/rules/github/repository/visibility.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/visibility.yaml)  
**Rego Source:** [visibility.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/repository/visibility.rego)  
**Labels:** GitHub, Repository  

Verify only GitHub repositories in the Allowed List are public.

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
allowed_repo_names: []
```

