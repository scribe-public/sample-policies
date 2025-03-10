# Rule: Required Git Evidence Exists

**ID**: `required-git-evidence`  
**Source**: [v2/rules/git/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/evidence-exists.yaml)  
**Rego File Path**: `evidence-exists.rego`  

**Labels**: Git

**Short Description**: Verify required Git evidence exists.

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: cyclonedx-json
target_type: git
```
