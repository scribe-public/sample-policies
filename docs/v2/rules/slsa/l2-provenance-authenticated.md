# Rule: Verify that provenance is authenticated

**ID**: `SLSA.L2`  
**Source YAML**: `l2-provenance-authenticated.yaml`  
**Rego File Path**: `l2-provenance-authenticated.rego`  

**Labels**: SLSA

**Short Description**: Verify the artifact is signed.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: true
content_body_type: slsa
```
## Rule Parameters (`with`)

```yaml
identity:
  common-names: []
  emails: []
```
