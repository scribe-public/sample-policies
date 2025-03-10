# Restrict Disallowed SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-disallowed-licenses`  
**Uses:** `sbom/banned-licenses@v2/rules`  
**Source:** [v2/rules/sbom/banned-licenses.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-licenses.yaml)  
**Rego Source:** [banned-licenses.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-licenses.rego)  
**Labels:** SBOM, Image  

Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold.

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
