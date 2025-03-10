# Rule: Verify No Critical or High Vulnerabilities  
**ID:** `scribe-cve`  
**Uses:** `api/scribe-api-cve@v2/rules`  
**Source:** [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source:** [scribe-api.rego](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.rego)  
**Labels:** SCA, Blueprint, Scribe  

Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

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
superset:
  cve:
    max: 0
    severity: 6
```

