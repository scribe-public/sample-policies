# Restrict Coding Permissions  
**Type:** Rule  
**ID:** `git-coding-permissions`  
**Uses:** `git/coding-permissions@v2/rules`  
**Source:** [v2/rules/git/coding-permissions.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.yaml)  
**Rego Source:** [coding-permissions.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.rego)  
**Labels:** Git  

Verify only allowed users committed to the repository.

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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| ids | [] |
| files | [] |
