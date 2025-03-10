# Disallow Specific Users in SBOM  
**Type:** Rule  
**ID:** `sbom-disallowed-users`  
**Uses:** `sbom/banned-users@v2/rules`  
**Source:** [v2/rules/sbom/banned-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-users.yaml)  
**Rego Source:** [banned-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-users.rego)  
**Labels:** SBOM, Image  

Verify specific users are not allowed in an SBOM.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| users | ['root'] |
