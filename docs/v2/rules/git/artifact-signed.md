# Rule: Git Artifact Signed

**ID**: `git-artifact-signed`
**Source**: [v2/rules/git/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/git/artifact-signed.yaml)
**Uses**: `git/artifact-signed@v2/rules
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
