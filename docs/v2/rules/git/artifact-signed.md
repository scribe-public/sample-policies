# Rule: Git Artifact Signed

**ID**: `git-artifact-signed`  
**Source YAML**: `artifact-signed.yaml`  
**Rego File Path**: `artifact-signed.rego`  

**Labels**: Git

**Short Description**: Verify the Git artifact is signed.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: true
content_body_type: cyclonedx-json
target_type: git
```
## Rule Parameters (`with`)

```yaml
identity:
  common-names: []
  emails: []
```
