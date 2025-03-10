# Rule: Verify IaC Misconfiguration Threshold in Trivy SARIF

**ID**: `trivy-iac-findings`  
**Uses**: `sarif/trivy/report-trivy-iac-errors@v2/rules  
**Source**: [v2/rules/sarif/trivy/report-trivy-iac-errors.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/report-trivy-iac-errors.yaml)  
**Rego Source**: [../report-iac-errors.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/../report-iac-errors.rego)  
**Short Description**: Verify the number of infrastructure-as-code (IaC) errors in the Trivy SARIF report remains below the specified threshold.  
**Labels**: SARIF, Trivy

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
violations_threshold: 0
```
