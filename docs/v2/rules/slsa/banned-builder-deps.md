# Rule: Disallow dependencies in SLSA Provenance Document

**ID**: `slsa-builder-unallowed-dependencies`  
**Source**: [v2/rules/slsa/banned-builder-deps.yaml](scribe-public/sample-policies.git/v2/rules/slsa/banned-builder-deps.yaml)  
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
