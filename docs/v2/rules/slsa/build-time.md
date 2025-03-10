# Rule: Verify build time

**ID**: `slsa-build-time`
**Source**: [v2/rules/slsa/build-time.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.yaml)
**Uses**: `slsa/build-time@v2/rules
**Rego File Path**: `build-time.rego`

**Labels**: SLSA, Image

**Short Description**: Verify the artifact was created within the specified time window.

## Evidence Requirements

```yaml
signed: false
content_body_type: slsa
target_type: container
```
## Rule Parameters (`with`)

```yaml
start_hour: 8
end_hour: 20
workdays:
- Sunday
- Monday
- Tuesday
- Wednesday
- Thursday
```
