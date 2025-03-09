# Rule: Verify Trivy SARIF Report Compliance

**ID**: `trivy-report`  
**Source YAML**: `verify-trivy-report.yaml`  
**Rego File Path**: `../verify-sarif.rego`  

**Labels**: SARIF, Trivy

**Short Description**: Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
tool: Trivy Vulnerability Scanner
filter-by:
- product
```
## Rule Parameters (`with`)

```yaml
rule_level: []
precision: []
rule_ids: []
ignore: []
max_allowed: 0
```
