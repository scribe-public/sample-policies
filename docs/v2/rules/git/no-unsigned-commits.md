# Rule: Disallow Unsigned Commits  
**ID:** `git-disallow-unsigned-commits`  
**Uses:** `git/no-unsigned-commits@v2/rules`  
**Source:** [v2/rules/git/no-unsigned-commits.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.yaml)  
**Rego Source:** [no-unsigned-commits.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/no-unsigned-commits.rego)  
**Short Description:** Verify all commits are signed.  
**Labels:** Git  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | git |

