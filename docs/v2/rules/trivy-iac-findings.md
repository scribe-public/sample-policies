# Rule: Verify IaC Misconfiguration Threshold in Trivy SARIF

**ID**: `trivy-iac-findings`  
**Source YAML**: `report-trivy-iac-errors.yaml`  
**Rego File Path**: `../report-iac-errors.rego`  

**Labels**: SARIF, Trivy

**Short Description**: Verify the number of infrastructure-as-code (IaC) errors in the Trivy SARIF report remains below the specified threshold.

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
violations_threshold: 0
```
