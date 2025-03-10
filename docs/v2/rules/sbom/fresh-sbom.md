# Rule: Enforce SBOM Freshness  
**ID:** `fresh-sbom`  
**Uses:** `sbom/fresh-sbom@v2/rules`  
**Source:** [v2/rules/sbom/fresh-sbom.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/fresh-sbom.yaml)  
**Rego Source:** [fresh-sbom.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/fresh-sbom.rego)  
**Short Description:** Verify the SBOM is not older than the specified duration.  
**Labels:** SBOM  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Rule Parameters (`with`)  
```yaml
max_days: 30
```

