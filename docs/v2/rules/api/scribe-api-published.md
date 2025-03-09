# Rule: Scribe Published Policy

**ID**: `scribe-published-policy`  
**Source YAML**: `scribe-api-published.yaml`  
**Rego File Path**: `scribe-api-published.rego`  

**Labels**: Scribe

**Short Description**: Verify image Scribe Publish flag is set for container image.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
```
## Rule Parameters (`with`)

```yaml
superset:
  published: null
```
