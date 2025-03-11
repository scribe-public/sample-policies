# Disallow Commits to Main Branch  
**Type:** Rule  
**ID:** `git-disallow-commits-to-main`  
**Uses:** `git/no-commit-to-main@v2/rules`  
**Source:** [v2/rules/git/no-commit-to-main.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/no-commit-to-main.yaml)  
**Rego Source:** [no-commit-to-main.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/no-commit-to-main.rego)  
**Labels:** Git  

Verify commits made directly to the main branch are disallowed.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  
> This rule scoped by product and target.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

