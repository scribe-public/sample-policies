# Rule: Verify Provenance Document Exists

**ID**: `SLSA.L1`  
**Source YAML**: `l1-provenance-exists.yaml`  
**Rego File Path**: `l1-provenance-exists.rego`  

**Labels**: SLSA

**Short Description**: Verify that the Provenance document evidence exists.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: slsa
```
