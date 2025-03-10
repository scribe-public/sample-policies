# Git Artifact Signed  
**Type:** Rule  
**ID:** `git-artifact-signed`  
**Uses:** `git/artifact-signed@v2/rules`  
**Source:** [v2/rules/git/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/git/artifact-signed.rego)  
**Labels:** Git  

Verify the Git artifact is signed.

> Evidence for this rule **IS* required by default.**


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | True |
| content_body_type | cyclonedx-json |
| target_type | git |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| identity | {'common-names': [], 'emails': []} |
