# Rule: Restrict Build Scripts

**ID**: `images-disallowed-build-script`  
**Source YAML**: `blocklist-build-scripts.yaml`  
**Rego File Path**: `blocklist-build-scripts.rego`  

**Labels**: SBOM, Images

**Short Description**: Verify no build scripts commands appear in block list.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
blocklist: []
```
