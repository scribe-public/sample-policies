# Rule: Verify No Critical or High Vulnerabilities

**ID**: `scribe-cve`  
**Uses**: `api/scribe-api-cve@v2/rules  
**Source**: [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source**: [scribe-api.rego](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.rego)  
**Short Description**: Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).  
**Labels**: SCA, Blueprint, Scribe

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
superset:
  cve:
    max: 0
    severity: 6
```
