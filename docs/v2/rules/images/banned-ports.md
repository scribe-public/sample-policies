# Rule: Banned Ports

**ID**: `images-banned-ports`  
**Source YAML**: `banned-ports.yaml`  
**Rego File Path**: `banned-ports.rego`  

**Labels**: SBOM, Images

**Short Description**: Ensures that the container image does not expose ports that are disallowed by organizational policy.
The rule examines properties in the SBOM metadata and checks each value (expected in the format "port/protocol") against a provided banned ports list.
It fails if any banned port is exposed or if no banned ports list is provided.


## Evidence Requirements

```yaml
content_body_type: cyclonedx-json
target_type: container
filter-by:
- target
- product
```
## Rule Parameters (`with`)

```yaml
banned_ports:
- port: '3000'
  protocol: tcp
```
