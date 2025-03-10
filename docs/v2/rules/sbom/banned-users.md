# Rule: Disallow Specific Users in SBOM

**ID**: `sbom-disallowed-users`
**Source**: [v2/rules/sbom/banned-users.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-users.yaml)
**Uses**: `sbom/banned-users@v2/rules
**Rego Source**: [banned-users.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/banned-users.rego)

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
