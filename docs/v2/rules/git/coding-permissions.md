# Rule: Restrict Coding Permissions  
**ID:** `git-coding-permissions`  
**Uses:** `git/coding-permissions@v2/rules`  
**Source:** [v2/rules/git/coding-permissions.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.yaml)  
**Rego Source:** [coding-permissions.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/coding-permissions.rego)  
**Short Description:** Verify only allowed users committed to the repository.  
**Labels:** Git  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

## Rule Parameters (`with`)  
```yaml
ids: []
files: []
```

