# Rule: Verify that artifact has no disallowed builder dependencies

**ID**: `slsa-verify-byproducts`  
**Source YAML**: `verify-byproducts.yaml`  
**Rego File Path**: `verify-byproducts.rego`  

**Labels**: SLSA, Image

**Short Description**: Verify the artifact has no disallowed builder dependencies.

## Evidence Requirements

```yaml
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
byproducts: []
```
