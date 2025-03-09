# Rule: 4.2.1 Registry Connection HTTPS

**ID**: `images-registry-https-check`  
**Source YAML**: `enforce-https-registry.yaml`  
**Rego File Path**: `enforce-https-registry.rego`  

**Labels**: Registry, Images

**Short Description**: Checks if the container's registry scheme is HTTPS by looking for a
property named 'registry_scheme' with value 'https'. If none found,
the rule fails, indicating a non-HTTPS registry.


## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
filter-by:
- product
- target
```
