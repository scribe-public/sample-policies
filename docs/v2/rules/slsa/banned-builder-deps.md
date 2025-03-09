# Rule: Disallow dependencies in SLSA Provenance Document

**ID**: `slsa-builder-unallowed-dependencies`  
**Source YAML**: `banned-builder-deps.yaml`  
**Rego File Path**: `banned-builder-deps.rego`  

**Labels**: SLSA, Image

**Short Description**: Verify that dependencies in the block list do not appear in the SLSA Proveance document.

## Evidence Requirements

```yaml
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
blocklist: []
```
