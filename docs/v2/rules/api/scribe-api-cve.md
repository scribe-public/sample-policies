# Rule: Verify No Critical or High Vulnerabilities

**ID**: `scribe-cve`  
**Source YAML**: `scribe-api-cve.yaml`  
**Rego File Path**: `scribe-api.rego`  

**Labels**: SCA, Blueprint, Scribe

**Short Description**: Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

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
