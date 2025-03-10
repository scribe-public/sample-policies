# Rule: Required Trivy Evidence Exists

**ID**: `required-trivy-evidence`  
**Source**: [v2/rules/generic/trivy-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/trivy-exists.yaml)  

**Labels**: 3rd-party

**Short Description**: Verify required Trivy evidence exists

## Evidence Requirements

```yaml
content_body_type: generic
target_type: data
predicate_type: https://aquasecurity.github.io/trivy/v0.42/docs/configuration/reporting/#json
```
