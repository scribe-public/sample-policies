# Rule: Enforce SBOM License Completeness  
**ID:** `sbom-require-complete-license-set`  
**Uses:** `sbom/complete-licenses@v2/rules`  
**Source:** [v2/rules/sbom/complete-licenses.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.yaml)  
**Rego Source:** [complete-licenses.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/complete-licenses.rego)  
**Short Description:** Verify all dependencies in the artifact have a license.  
**Labels:** SBOM, Image  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

