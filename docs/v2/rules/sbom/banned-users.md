# Rule: Disallow Specific Users in SBOM

**ID**: `sbom-disallowed-users`  
**Source YAML**: `banned-users.yaml`  
**Rego File Path**: `banned-users.rego`  

**Labels**: SBOM, Image

**Short Description**: Verify specific users are not allowed in an SBOM.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
users:
- root
```
