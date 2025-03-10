# Rule: Enforce SBOM Dependencies  
**ID:** `sbom-required-dependencies`  
**Uses:** `sbom/required-packages@v2/rules`  
**Source:** [v2/rules/sbom/required-packages.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/required-packages.yaml)  
**Rego Source:** [required-packages.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/required-packages.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all required dependencies.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
required_pkgs: []
violations_limit: 0
```

