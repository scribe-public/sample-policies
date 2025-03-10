# Rule: Disallow Container Shell Entrypoint

**ID**: `images-disallow-shell-access`
**Source**: [v2/rules/images/restrict-shell-entrypoint.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/restrict-shell-entrypoint.yaml)
**Uses**: `images/restrict-shell-entrypoint@v2/rules
**Rego File Path**: `restrict-shell-entrypoint.rego`

**Labels**: SBOM, Images

**Short Description**: Verify the container image disallows shell entrypoint.

## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
