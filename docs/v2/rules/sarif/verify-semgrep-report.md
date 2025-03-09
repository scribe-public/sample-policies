# Rule: Verify Semgrep Rule in SARIF

**ID**: `sarif-semgrep-report`  
**Source YAML**: `verify-semgrep-report.yaml`  
**Rego File Path**: `verify-semgrep-report.rego`  

**Labels**: SARIF, Semgrep

**Short Description**: Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
rule_ids: []
violations_threshold: 0
```
