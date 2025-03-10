# Rule: Verify Trivy SARIF Report Compliance

**ID**: `trivy-report`  
**Source**: [v2/rules/sarif/trivy/verify-trivy-report.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/trivy/verify-trivy-report.yaml)  
**Rego File Path**: `../verify-sarif.rego`  

**Labels**: SARIF, Trivy

**Short Description**: Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
tool: Trivy Vulnerability Scanner
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
rule_level: []
precision: []
rule_ids: []
ignore: []
max_allowed: 0
```
