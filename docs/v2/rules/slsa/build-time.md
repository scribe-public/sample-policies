# Rule: Verify build time

**ID**: `slsa-build-time`  
**Uses**: `slsa/build-time@v2/rules  
**Source**: [v2/rules/slsa/build-time.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.yaml)  
**Rego Source**: [build-time.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/build-time.rego)  
**Short Description**: Verify the artifact was created within the specified time window.  
**Labels**: SLSA, Image

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
