# Rule: Required Git Evidence Exists

**ID**: `required-git-evidence`  
**Source YAML**: `evidence-exists.yaml`  
**Rego File Path**: `evidence-exists.rego`  

**Labels**: Git

**Short Description**: Verify required Git evidence exists.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: git
```
