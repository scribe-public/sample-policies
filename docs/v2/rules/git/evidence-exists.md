# Required Git Evidence Exists  
**Type:** Rule  
**ID:** `required-git-evidence`  
**Uses:** `git/evidence-exists@v2/rules`  
**Source:** [v2/rules/git/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/evidence-exists.rego)  
**Labels:** Git  

Verify required Git evidence exists.

> Evidence **IS** required for this rule and will fail if missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  
> This rule scoped by product and target.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

