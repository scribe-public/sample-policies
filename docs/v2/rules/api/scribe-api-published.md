# Rule: Scribe Published Policy

**ID**: `scribe-published-policy`  
**Source**: [v2/rules/api/scribe-api-published.yaml](scribe-public/sample-policies.git/v2/rules/api/scribe-api-published.yaml)  
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
