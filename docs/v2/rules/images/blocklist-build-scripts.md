# Rule: Restrict Build Scripts

**ID**: `images-disallowed-build-script`
**Source**: [v2/rules/images/blocklist-build-scripts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.yaml)
**Uses**: `images/blocklist-build-scripts@v2/rules
**Rego Source**: [blocklist-build-scripts.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.rego)

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
