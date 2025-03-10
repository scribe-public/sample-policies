# Rule: Verify IaC Misconfiguration Threshold in SARIF

**ID**: `sarif-iac-findings`
**Source**: [v2/rules/sarif/report-iac-errors.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/report-iac-errors.yaml)
**Uses**: `sarif/report-iac-errors@v2/rules
**Rego Source**: [report-iac-errors.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/report-iac-errors.rego)

**Labels**: SARIF

**Short Description**: Verify the number of infrastructure-as-code (IaC) errors in the SARIF report remains below the specified threshold.

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
