# Require SBOM Existence  
**Type:** Rule  
**ID:** `require-sbom`  
**Uses:** `sbom/evidence-exists@v2/rules`  
**Source:** [v2/rules/sbom/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/evidence-exists.yaml)  
**Rego Source:** [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/evidence-exists.rego)  
**Labels:** SBOM, Blueprint  

Verify the SBOM exists as evidence.

> Evidence **IS** required for this rule and will fail if missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |
| signed | False |

