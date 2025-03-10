# Restrict Disallowed Dependencies  
**Type:** Rule  
**ID:** `sbom-disallow-dependencies`  
**Uses:** `sbom/blocklist-packages@v2/rules`  
**Source:** [v2/rules/sbom/blocklist-packages.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/blocklist-packages.yaml)  
**Rego Source:** [blocklist-packages.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/blocklist-packages.rego)  
**Labels:** SBOM, Image, Blueprint  

Verify the number of disallowed dependencies remains below the specified threshold.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  
> This rule scoped by product and target.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| blocklist | [] |
| blocklisted_limit | 0 |
