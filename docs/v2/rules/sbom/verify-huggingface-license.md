# Require Specified SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-hf-license`  
**Uses:** `sbom/verify-huggingface-license@v2/rules`  
**Source:** [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/verify-huggingface-license.yaml)  
**Rego Source:** [verify-hf-license.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/verify-hf-license.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all specified licenses.

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
| licenses | [] |
